---
layout: post
title: "Emacs: which-function-mode"
description: "Emacs: which-function-mode. Show the function name you're currently in"
tags: emacs
---

## The problem

I sometimes work with long functions or big org subtrees and it's not always clear
what function or org subtree I'm in right now.
I wish there is a package that can show me what function I'm in.

## which-function-mode

<a target="_blank" href="/assets/img/which-function-mode.png"><img alt="trace output" src="/assets/img/which-function-mode.png" width="800px"/></a>

Turns out Emacs has this mode built-in so this functionality is just `M-x which-function-mode` away.
It shows in the status line a function name I'm currently in (see `[encode_terminal_code]` on the screenshot above).
It's global mode so as soon as it's enabled,  you'll see it's working for every buffer.
You can have it enabled on Emacs startup by adding `(which-function-mode)` to your config file.
<br><br>
I just started to get benefits of this mode but it's already surprising how well it works:
- it works in various prog modes
- it works in org mode
- it even works in markdown files

It doesn't seem to work in html files I tried it with or modes that use html (e.g. vuejs or laravel blade files).
<br>It definitely not an issue for me so I'm going to continue using it and <strong>I suggest you to try it out</strong>.
