---
date: "2021-03-28T00:00:00Z"
description: Solution for Hermit 2 challenge from UMassCTF 2021
tags: hacking
title: UMassCTF '21 Hermit 2 WriteUp
---

<center><a target="_blank" href="/assets/img/hermit2-into.png"><img alt="hermit logo" src="/assets/img/hermit2-into.png" width="400px"/></a></center>

## Solution

The image above is what we see when visiting the challenge URL (`104.197.195.221:8087`)

That's strange. Initially I thought the site is down but it's fine.

Let's try to connect with NetCat and see what the server tell us and why browser can't display it.

`nc -vvv 104.197.195.221 8087`

and response we get back is:

```
221.195.197.104.bc.googleusercontent.com [104.197.195.221] 8087 (?) open
SSH-2.0-OpenSSH_7.9p1 Debian-10+deb10u2
```

Doesn't look like valid HTTP resopnse lol. Ok now we know that SSH server is running on that port so let's try to connect.

`ssh 104.197.195.221 -p 8087` - and we see the prompt to enter a password for myself (krydos). It isn't clear what user should I use.
And even if we know the user what is the password?

As a hint the challenge name is `hermit` so the user is probably has the same name but we still need to know password.

Poking around, trying different things I noticed that hermit 2 challenge is <strong>on the same IP address where hermit 1</strong> is.

That's actually great because we have shell access on the server from <a href="/2021/03/28/umassctf-hermit1-writeup.html">the previous challenge</a>.

So I went to `/home/hermit/.ssh` folder, copied user's private key and used it in my ssh command like this:

`ssh -i /tmp/hermit.ssh.private.key hermit@104.197.195.221 -p 8087`

We're in. Now... <strong>where is the flag?</strong>
We know one flag from the previous challenge but I wasn't able to find another one.

Grep'ing everything didn't help.
My assumption was that the flag is somewhere in `/root` folder or somewhere else where hermit user doesn't have access to.

Now... <strong>how can I become a root</strong>? Tried some stuff but didn't find anything useful.

Then I grepped for `flag` in `/etc` folder and I found

`hermit ALL = (root) NOPASSWD: /bin/gzip -f /root/rootflag.txt -t` in `/etc/sudoers` file.

This record means that we can execute that command without asking for password.

Let's do it:

`sudo /bin/gzip -f /root/rootflag.txt -t` and we see the flag - `UMASS{a_test_of_integrity}`

Hooray

