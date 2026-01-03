+++
date = '2026-01-03T21:22:17+11:00'
draft = false
title = 'Emacs: Dumb Jump Is So Good'
tags = ['emacs']
+++

There is a library I rely on constantly in my day to day computing, at work and at home.
This library is called [dumb-jump](https://github.com/jacktasia/dumb-jump).

I don't see it is prized as often as Magit for example, which made me write this post.

Below I explain what it does but first, let me thank to **Jack Angers** and all the contributors.
I have used this library for 10 years. It is one of the best computer programs I have ever used.
There were periods when I was off Emacs during that time and the first thing I looked for in other editors was a plugin similar to dumb-jump.

## What does it do

It jumps to definition of a function/method/class.

Here is my config for it:

```lisp
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-force-searcher 'rg)
  ;; use completion-read instead of a separate buffer with candidates
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read))
```

Combined with [rg](https://github.com/dajva/rg.el) it eliminated my need in LSPs or ctags/etags entirely.

Here is me using it on Emacs source code, which is big code base (click to view the video in a separate tab):

<a target="_blank" href="/assets/video/dumbjump-in-action.mov"><video src="/assets/video/dumbjump-in-action.mov" width="100%"/></a>

In this video I:

- press `M-.` to go to definition.
- In less than a second I get matching definitions that I can filter if necessary.
- I jump straight to the definition.

## How does it work

It just greps the entire project for the symbol at point. The best thing about it is that with LSP for example it's impossible
(or rather I haven't seen it working) to place my cursor over a function name in a comment somewhere and jump to it.

Like in:

```js
/**
 * This test function is cool but
 * check another_function_name for more info
 */
 function test() {}
```

With dumb-jump - I can place my cursor at **another_function_name**, press **M-.** and I'm looking at the definition of it.

It works with **ANY** programming language.

## Why not

### ctags/etags

Every time a file is changed the ctags table must be regenerated. It can be automated but I think it's unnecessary overhead.

### LSP (Eglot)

I love LSP as a technology but I don't want a background process to run on my machine while I'm working on a project.
What if during the day I work on 10 projects, which is real for me at work for example. It will spawn 10 background processes
for different languages that I have to mentally track (because I do mentally track what's running in my computing environment).

The amount of RAM and CPU spent on this just feels too expensive.

## Summary

If for some reason you haven't tried this library - try. It's so good.

I wish I can find better words on how grateful I am that it exists. Thank you!
