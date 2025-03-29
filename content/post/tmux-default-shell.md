---
date: "2018-02-05T00:00:00Z"
description: set default shell for tmux
tags: terminal tmux
title: Tmux, default shell
---

Hey,

recently I've switched to Windows and trying to adapt WSL (linux subsystem) to make it play together with my habits.

This time the issue was Tmux starting bash when I need ZSH. No matter what shell was set by `chsh -s` command Tmux was don't care.

The thing I found on stackoverflow is setting `default-shell` option of Tmux to `/bin/zsh` (in my case).

Here is what you need to add to your `~/.tmux.conf`:

```bash
set-option -g default-shell /bin/zsh
```

<br/>

Don't forget to restart your Tmux or `:source-file` the new configuration.
