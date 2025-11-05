+++
date = '2025-11-05T16:29:36+11:00'
draft = false
tags = 'emacs'
title = 'Emacs: find-file-at-point trick'
+++

## The story

Sometimes I hover over a file path in my terminal emulator (in Emacs of course) and type<br>
`M-x find-file-at-point`.
It's nice command and it works reliably.

I don't want to type it though. I want Emacs to detect a file path at point.

And there is a [built in package](https://www.gnu.org/software/emacs/manual/html_node/emacs/FFAP.html) for this.
Just add this line to your `init.el` and it should work.

```lisp
(ffap-bindings)
```

This makes **C-x C-f** keybinding to automatically detect a file path at point. Cool!

## The twist

Unfortunately it was so much worse than what I've expected.

It does detect file path at point so reliably and so often (there are lots of file paths in my terminal output usually)<br>
that almost 80% of time when I press **C-x C-f** my minibuffer is already pre-filled with the path my cursor happened to be on,
which I didn't need. I wanted it to be clean so I could type a file path there by myself.

I noticed that using ffap package adds a bit of cognitive overload for my workflow. I have to always think about where my cursor is before I press **C-x C-f**.

I decicded to write my own function that should check for `current-prefix-arg` and call `find-file` or `find-file-at-point` accordingly
but just before that I decided to read some docs.

## RTFM

Something that I don't think I've ever done is **C-h f find-file**.

I learned this keybinding early on in my Emacs journey and never needed to read a documentation for it.

But if I read it, it says something about **M-n** keybinding that uses functions defined in `file-name-at-point-functions` variable.
One of them, by default, is `ffap-guess-file-name-at-point`.

So having my cursor at a file path, I can type **C-x C-f** get my regular `find-file` behavior and then I can just press **M-n** and the minibuffer will be pre-filled with the file path at point.<br>
<small>*^here is how small this blog post could be lol*</small>

Perfection.
