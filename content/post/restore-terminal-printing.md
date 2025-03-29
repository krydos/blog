---
date: "2018-03-10T00:00:00Z"
description: Fix terminal after printing of binary file
tags: terminal
title: Restore terminal printing
---

Hey,

sometimes I accidentaly print binary file with `cat <thefile.bin>` and my
terminal is getting broken after that due to printing of some escape characters.

To fix it you can use `reset` command. Checkout the `man reset` to get more info about this command.
