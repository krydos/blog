---
layout: post
title: Custom icon for terminal application in gnome-shell
description: Custom icon for terminal application in gnome-shell
---

Hey,

## The problem

Recently I wanted to create separated "window" for my weechat
so I can easily alt-tab to it.

I've wrote the .desktop file and place it to `~/.local/share/applications` so
gnome-shell (I'm on ubuntu 17.10) will show me it.

And it did, BUT when I start the weechat the icon turned to "terminal-like".

Hm...

## play with terminal icon

Ok, there is terminals like `xfce4-terminal` that allows to set custom icon
when terminal is starting... so let's try

```
xfce4-terminal -I /the/icon/i/need -e /usr/bin/weechat
```
<br/>

...aaaand nothing!

There are other temrinals allows us to set custom icon but non of them was working.

## The reason

It turned out the gnome-shell overrides everything it thinks is a terminal with the icon from theme currently used.

## Solution

Discarding some guesses I decided that gnome-shell determines that app belongs to "terminal family" based on WM\_CLASS
window property (you can see them using `xprop`). Thanks god (or gnome developers) the gnome-terminal has `--class` option
that overrides the WM\_CLASS property. After that my .desktop file just works.

Here is an example:

```
[Desktop Entry]
Version=1.9.1
Name=Weechat
Comment=Weechat the IRC client
Exec=gnome-terminal --role=weechat --class=weechat -- /usr/bin/weechat
Icon=/usr/share/icons/hicolor/32x32/apps/weechat.png
Terminal=False
Type=Application
Categories=Chat;Development;
```

See `Exec` value with `--role` and `--class` options.
