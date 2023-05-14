---
layout: post
title: MacOS fix not stable WiFi (ping spikes)
description: MacOS fix ping spikes on WiFi connection
tags: macos
---

hey,

I currently use Windows machine but I do programming inside Linux virtual machine and
inside MacOS driven laptop (some iOS specific stuff) which is in the same room where I am and connected to the local network.

Since I develop in Vim I use SSH connection to run Vim instance directly on MacOS machine.
If I need anything graphical (like Xcode) I use VNC client.

Issue
-----

SSH connection is super non-stable. It's pretty painful to use Vim with very slow connection. If I try to ping my MacOS laptop
I can see clearly some ping spikes. Usual ICMP travel time is about 3ms but sometimes I get 700ms or 1000ms. Insane.

Solution
--------

Based on [this found](https://symless.com/forums/topic/5902-workaround-macos-wifi-ping-spikes/)
it is probably related to WiFi card power saving features.

To prevent it you can use this command (inside MacOS machine)

```
ping -q -n -s 0 -i 0.1 192.168.0.1  # you can ping any (real) address basically
```

What this ping command does is just keeping your WiFi card busy all the time.

Please note, you have to keep this command running all the time. You can probably create some kind of background script
but I just use alias which I run when I'm connected to my Mac. Otherwise I don't want to overload my home network.
