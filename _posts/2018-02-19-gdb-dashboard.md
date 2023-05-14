---
layout: post
title: GDB dashboard
description: gdb dashboard package
tags: gdb
---

If you use GDB you definitely have to try [Dashboard package](https://github.com/cyrus-and/gdb-dashboard) by Andrea Cardaci.

Here is how it looks like:

<center><a href="/assets/img/gdb-dashboard.png" target="_blank"><img width="600px" src="/assets/img/gdb-dashboard.png"/></a></center>
^ Click to make it bigger.

Looks very nice, it updates itself each time when you `step` or do another action.
It was confusing why Memory area is empty by default and shows nothing even when I try to `x <memory>`.

It turned out I have to tell dashboard to watch for particular area of memory. Here is how to do it:

`dashboard memory watch <addr> <how many bytes>`

for example:

`dashboard memory watch $ebp 42`

Now it looks awesome.
