---
layout: post
title: GDB oneliners
comments: true
description: gdb ex command oneliners
---

Recently I wanted to print disassembled main funciton of the program to the file
so I can read it in my Emacs, but it turned out I can't simply redirect the GDB output
to the file with `disassemble main > main.asm` command in gdb command line.

But there is `-ex` option exists in gdb command so we can execute some gdb commands
right after gdb is initialized.

Looks like this:

```bash
gdb <file> -ex 'disassemble main' -ex 'quit' > main.asm
```
<br/>
As you can see we can chain multiple commands. It's important to have `quit` as the last one
to make sure we exit GDB.
