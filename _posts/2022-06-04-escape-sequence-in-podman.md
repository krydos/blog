---
layout: post
title: Podman detach keys
date: 2022-06-04 15:30:00 +03:00
description: podman, broken ctrl-p
---

## TLDR;
Add `detach-keys = "ctrl-@,ctrl-q"` to `[engine]` section in `~/.config/containers/containers.conf` file

## Description

I recently switched to Podman and the only issue I faced is CTRL+P won't work properly inside containers.

That's exactly the same issue I had with Docker, described in my <a href="/2018/03/01/docker-terminal-navigation.html">Docker detach keys</a> post.

The solution from that post doesn't work since it was purely docker-specific configuration file.

In case of Podman the configuration file is `~/.config/containers/containers.conf`.

The line that must be added is `detach_keys = "ctrl-@,ctrl-q"` (feel free to choose any other sequence).

The line must be added under `[engine]` table.

When this is done `ctrl-p` is not going to be a keybinding that starts an escape sequence.
