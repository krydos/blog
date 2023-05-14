---
layout: post
title: GDB print string from memory
description: gdb print string from memory, examine
tags: gdb
---

Hey,
just found a command for gdb that prints a string from memory address.

Looks like this `x /s <addr>`. Very useful if you need to print out the string that is in memory somewhere.

Previously I've used other flags to print for example hex values but was pretty hard to read.
Glad there is special solution in GDB for this.
