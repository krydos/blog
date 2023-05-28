---
layout: post
title: Emacs has built-in thread macros
description: emacs lisp thread-first and thread-last macros
tags: emacs
---

## Intro

Surprisingly for me I just discovered that Emacs Lisp has equivalent
of Clojure's `->` and `->>` macros.

And I'm not talking about `dash.el`. I'm talking about built-in `thread-first` and `thread-last`.

## What are these

If you're not familiar with these beautiful macros, the main goal is to pipe a value through multiple functions
and return the result.

`->` passes a value as first argument of next function, then takes the result and passes it as first argument to next function, etc.<br>
`->>` does the same except that it passes the result as next function's last argument

### Example

Instead of having this:

```lisp
(+ (- (/ (+ 5 20) 25)) 40)
```

we can have this:

```lisp
(->
  5
  (+ 20)
  (/ 25)
  -
  (+ 40))
```

It's way easier to modify and which is even more important - to read.

## Emacs lisp equivalent

There is `dash.el` library that provides us with similar macros (and many more) but emacs has built-in `thread-first` and `thread-last`.

```lisp
(thread-first
  5
  (+ 20)
  (/ 25)
  -
  (+ 40))
```

will work for you if you're on Emacs 25 or newer.

I don't write much elisp but every time I do I feel like I miss those `->`/`->>`.

Not anymore!
