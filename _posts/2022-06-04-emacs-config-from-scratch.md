---
layout: post
title: Ditching Doom
date: 2022-06-04 16:00:00 +03:00
description: Using config from scratch instead of Doom
---

In my previous post I've been talking about Doom config and that it is great and all but
I find it really difficult to fix issues there.
Doom has a lot of its own configuration, hooks here and there and functions that modifies standard behavior.

It's probably much easier to go with my own config. I never could stick to spacemacs or doom. I couldn't stick to similar configs in Vim too.
Probably issue on my end :)

Also Doom's evil mode feels so verbose. It definitely feels more verbose than Vim itself. It feels like I have to press
much more keys to tell emacs to do something.

At the moment I'm on my own config WITHOUT evil-mode and interesting to note, my muscle memory switched to Emacs-mode in ~30 minutes.
I didn't expect that. For most of the actions there is no a "thinking process". They just happen.
Last time I used Emacs was couple of years ago and I'm surprised it's keybindings went that deep in my muscle memory.

Maybe, which is strange for me to admit, the keybinding design in Emacs is a feature...

Anyway here is some highlight of my config:

* UI is standard-minimal. No toolbar, no scroll-bar, no bells. Automatically start maximized
* MacOS' CMD key is bound to `meta`
* Trailing spaces are deleted with `delete-trailing-whitespace` on every buffer save
* Indent with spaces by default
* Vertico for vertical completion (like helm or ivy)
* Consult for some nice functions like `consult-imenu` or `consult-buffer`
* Orderless for fuzzy-like autocompletion
* Projectile
* Magit
* Flycheck
* Company
* Vterm - possibly the greatest terminal emulation in Emacs I could fine
* Prodigy - love this tool. Allows you to manage services running on your machine.
* various lang modes

What's pretty interesting and I couldn't expect I'd like is a white color scheme.

All of those are working pretty well and if I need to override some of their behavior
it usually something super simple, unlike Doom or Spacemacs where some functionality overridden by the "package" configuration that you gotta
go and inspect and then find some hooks that also adds additional layer of configuration.

Screenshot (click to zoom):

<a href="/assets/img/own-emacs-config-example-white-theme.png" target="_blank"><img width="800px" src="/assets/img/own-emacs-config-example-white-theme.png" /></a>
