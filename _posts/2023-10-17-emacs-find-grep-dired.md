---
layout: post
title: "Emacs find-grep-dired: Filter files based on content"
description: Emacs Dried - filter files based on content
tags: emacs
---

## Intro

We all need to search in files sometimes, right?

I usually do it using `grep -ri 'search term' .` in the terminal (often in vterm-mode)
and then I either open the file(s) in Emacs or in any other program.

But Emacs has better solution to it.

## find-grep-dired

There is `M-x find-grep-dired` already built-in to Emacs.
If you call it from Dired buffer it will auto-complete the current folder
and then you just need to enter the search term.

Cool thing is that result of this function is just filtered Dired buffer which means
you can perform regular Dired operations on the found files (delete them, move to another folder, etc).<br>
This especially come in handy if you have `(setq dired-dwim-target t)` and another Dired buffer opened in split so you
can quickly move files between splits (Far/Total Commander style).

## Configuration

`M-x find-grep-dired` is as quick as `grep` is. <br>
According to this function's help page you can change `grep-program` variable
if you want to use rg, ag or whatever...<br>
CAUTION: It's pretty possible `grep-program` may be used by other Emacs functions that may expect grep-specific output.
