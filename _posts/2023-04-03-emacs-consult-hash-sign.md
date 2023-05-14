---
layout: post
title: Search for hash(#) sign using Emacs' consult-grep
description: Emacs consult escape hash sing
tags: emacs
---

This is something I came across recently.
I wanted to search for `#todo` using `M-x consult-grep`.

My initial `#todo` query didn't work obviously because `#` sign in consult
is a *punctuation character* as they call it.

I didn't really want to change `#` sign as a punctuation character because I used to it.
I'm not also sure if there is such an option (read til the end to find out why)

After some time spent googling
I couldn't find how to do escape it.
Obvious things like `#\#todo` didn't work.

Then I found this example in [consult readme](https://github.com/minad/consult#asynchronous-search):

* `/defun/consult`: It is also possible to use other punctuation characters.

This is not somewhere on the top of the readme. It's under *Asynchronous Search* section which
I ignored while I was looking for my use case.

So it seems like any NON [A-Za-z0-9] character can be a punctuation character.
Though I'm not sure about it.

In any case `/#todo` worked nicely but it was unnecessary hard to find the proper syntax for it.
