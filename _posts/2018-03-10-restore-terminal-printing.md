---
layout: post
title: Restore terminal printing
description: Fix terminal after printing of binary file
---

Hey,

sometimes I accidentaly print binary file with `cat <thefile.bin>` and my
terminal is getting broken after that due to printing of some escape characters.

To fix it you can use `reset` command. Checkout the `man reset` to get more info about this command.
