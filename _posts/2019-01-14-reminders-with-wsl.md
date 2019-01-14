---
layout: post
title: Reminders with WSL
comments: true
description: Reminders with WSL using "at" Linux command
---

Hi everyone, 

I was looking for an app that should allow me to set a quick reminder 
without any additional functionality. 

The one was found, it is `at` binary which is available by default on most (if not all) Linux
distributions (checkout `man at`).
Shortly, the `at` command allows you to specify a command and time you want to run that command at. 

My current setup
================

What I want, is to get a notification at some special time.
For notifications we can use `notify-send`,
but since I'm currently on Windows and use WSL, we will use my `wsl-notify` script 
(checkout for [notify-send replacement for WSL]({% post_url 2019-01-13-wsl-windows-toast %}) post)


Complete remind script
=====================

I've added a function to my zshrc and called it `remind`.

Here is its code:

```bash
remind() {
  echo "/path/to/wsl-notify \"$1\"" | at "$2"
}
```

The usage is next:

```bash
$ remind 'call mom' '1:00pm'
```

And at 1:00pm I will get the native windows notification which I can even snooze. Brilliant.
