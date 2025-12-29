+++
date = '2025-12-29T12:49:12+11:00'
draft = false
title = 'Migration from Syncthing to Unison'
+++

I spent quite a bit of time yesterday migrating from [Syncthing](https://syncthing.net/) to [Unison](https://github.com/bcpierce00/unison).

## Why

About six months ago, I decided to move away from Syncthing due to an ethical dilemma.

Syncthing's usability is amazing, and I love the software. I am sad that I had to make the migration, but very happy that Unison exists and works great.

## How the migration went

It went smoothly (except one thing). Every operating system I have, including relatively rare ones like NetBSD, has the Unison package in their repo.

I chose to use [hub-and-spoke](https://en.wikipedia.org/wiki/Spoke%E2%80%93hub_distribution_paradigm) architecture where I have everything synced into a bucket (Hub) which is a NAS I have at home and every other machine just
syncs everything to and from it.

I have an Ansible playbook to configure my NAS so I just extended it with "Install Unison" task and that's it. I also added a few profiles to sync different things.

### Unison Profile

A profile is just a configuration file that you can call **anything.prf** and put in your `~/.unison` folder on the client.

In this file you can define your local folder, your remote folder you want to sync to/from (a folder on the Hub machine in my case) and add a few configuration options
to tell Unison how to handle permissions, what files to sync or not to sync, etc.

Looks like this:

```php
root = "/local/folder"
root = "ssh://remote-user@the-hub.local//home/remote-user/unison-sync"

batch = true
fastcheck = true

times = true
owner = false
group = false
perms = 0
```

Now you can just call **unison anything** ("anything" is the profile name) and it will sync both roots defined in the profile.

### Simplicity

As you probably noticed it all works via SSH. There are other options but all my devices have SSH access anyway.
This simplifies my mental model a lot. I just control the access as usual
using SSH keys which I already do and Unison doesn't add a new layer of access control complexity.

## Android difficulties (the one thing)

The migration to Unison was a bit tricky on my Android phone. I didn't even realise it would be an issue until I migrated all my machines and then opened my phone's Termux and typed:

```bash
pkg install unison
```

... and nothing happened. **There is no Unison in Termux repos**.

Following [this thread](https://github.com/termux/termux-packages/issues/129) I was able to compile this script to get OCaml and Unison source code and compile them both:

```bash
# These are probably already set in Termux but I'll set them just in case.
export PREFIX='/data/data/com.termux/files/usr'
export HOME='/data/data/com.termux/files/home'
export TMPDIR="$HOME/tmp"

mkdir -p $TMPDIR # download and compile stuff in this folder

# Build OCaml first
OCAML_VERSION=5.3.0
curl -L https://github.com/ocaml/ocaml/releases/download/${OCAML_VERSION}/ocaml-${OCAML_VERSION}.tar.gz -o "$TMPDIR/ocaml.tar.gz"
tar xzf "$TMPDIR/ocaml.tar.gz" -C "$TMPDIR"
cd "$TMPDIR/ocaml-${OCAML_VERSION}"
# Seems like we need -Wno-error=implicit-function-declaration during the configuration process
# otherwise it won't compile.
sh ./configure --prefix=$PREFIX --disable-warn-error --without-afl LDFLAGS="-landroid-shmem" CFLAGS="-Wno-error=implicit-function-declaration"

# Same -Wno-error=implicit-function-declaration during the compilation process
make world CFLAGS="-Wno-error=implicit-function-declaration"
make install

# Build Unison second
UNISON_VERSION=2.53.7
curl -L https://github.com/bcpierce00/unison/archive/v${UNISON_VERSION}.tar.gz -o "$TMPDIR/unison.tar.gz"
tar xzf "$TMPDIR/unison.tar.gz" -C "$TMPDIR"
cd "$TMPDIR/unison-${UNISON_VERSION}"
# Not sure if -Wno-error=implicit-function-declaration needed here but
# I'm gonna add it just in case
make NATIVE=false CFLAGS="-Wno-error=implicit-function-declaration"
make NATIVE=false install

# I don't want to keep source of both things I just compiled
rm -rf $TMPDIR
```

This worked. So now I have Unison on Android as well.

Hopefully OCaml and Unison packages will both be available in Termux soon.

## Usability

Syncthing is very seamless usability wise. With Unison I have to manually trigger the sync process.
I now have a couple of [Termux Widgets](https://github.com/termux/termux-widget) that sync my phone with the Hub.

There is a way to configure **watch** mechanism for Unison which I'll probably do later. I haven't decided yet if I want it or not.
Somehow I find the fact that synchronisation magic happens only on my request very satisfying.

## Summary

So far I'm pretty happy with it.

My Hub is available everywhere thanks to Tailscale so I can sync things any time anywhere.

Termux Widgets are pretty nice too. I had to change my workflow a bit but it's ok.

I was very close to rolling my own set of bash scripts to sync my files but I'm very happy I found about Unison.

Another positive side effect that I've noticed so far is that my Android phone's battery is holding the charge so much better. Usually by 3PM it is below 50% but right now it's 75%.
