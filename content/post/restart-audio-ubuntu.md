---
date: "2018-03-20T00:00:00Z"
description: Fix no sound on ubuntu 17.10 after suspend
tags: linux
title: Restart audio subsystem on Ubuntu
---

I'm on Ubuntu 17.10 right now and sometimes after suspend
I'm getting no sound and only dummy device available.

`pulseaudio -k && sudo alsa force-reload` - execute this to fix the issue.
