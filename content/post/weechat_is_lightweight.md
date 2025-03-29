---
date: "2023-05-31T00:00:00Z"
description: Weechat on freebsd takes 219 MiB of space
tags: weechat
title: Weechat is a lightweight IRC client
---

**This is more of a joke post**.

## Weechat is lightweight

Weechat is incredible, terminal based IRC client, that I wanted to install
recently on my FreeBSD instance.

It's <u>lightweight</u>.

Here is log from my `pkg install weechat`:

```bash
[user@server]# pkg install weechat
Updating FreeBSD repository catalogue...
FreeBSD repository is up to date.
All repositories are up to date.
The following 18 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
        aspell: 0.60.8_1,1
        glib: 2.72.2,2
        gmp: 6.2.1
        gnutls: 3.7.6
        libedit: 3.1.20210910,1
        libiconv: 1.16
        liblz4: 1.9.3,1
        libtasn1: 4.18.0
        libunwind: 20211201_1
        lua52: 5.2.4
        nettle: 3.8
        p11-kit: 0.24.1_1
        pcre: 8.45_1
        perl5: 5.32.1_1
        ruby: 3.0.4_2,1
        tcl86: 8.6.12
        weechat: 3.5_2
        zstd: 1.5.2

Number of packages to be installed: 18

The process will require 219 MiB more space.
40 MiB to be downloaded.

Proceed with this action? [y/N]:
```

**219 MiB** - isn't it funny? I think it is.<br/>
Slack `*.dmg` file for MacOS takes **168 MiB**.

## Seriously

Weechat itself is just **26 MiB**. It also really is lightweight and
feels fast. The number of extension is just countless. Number of color themes and layouts is huge too.

The 219 MiB comes from dependencies and you can see there are few programming languages are going to be installed:
- perl
- lua
- ruby
- tcl

These are not direct dependencies of weechat. It's just weechat's extension system allows you to use many programming languages to write extensions.
