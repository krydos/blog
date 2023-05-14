---
layout: post
title: Trying Doom once again
description: Try to switch to Doom after my vanilla config
tags: emacs
---

[Almost a year ago]({% post_url 2022-06-04-emacs-config-from-scratch %}) I already tried to start using Doom config which 
I eventually replaced with my own vanilla config.

Today I decided to try it once again. I also wanted to use it in Evil mode 
to make my hands feel better.

One of my main pain point with someone else's config is that I don't know how to handle it,
what options are available and why things work in the way they do. 

Since I was on my own config for quite some time I believe I know enough about 
Emacs configuration to attempt Doom config once again.

## First impression

Well, it's not first. If I'm not mistaken it's my third or fourth attempt to use Doom.

So far it feels ok. I ported some configuration from my vanilla config. Added packages I need and things seems working smoothly.

It's interesting to see that Doom preferably switched to `project` mode instead of `projectile` at least this is what I see
based on keybindings that are set for `project` mode and no keybindings at all for `projectile`.

My custom org agendas and some other custom functions were ported with just simple copy-paste technique.

## What I like

* It's really great to see the `M-x doom/help` exists. Everything is documented or at least most of the things.
* There is also `M-x doom/help-search` which is very useful when you need to find a specific help.
  * The documentation can be improved probably. There is no info about how to change `evil escape sequence` to something different from default. At least the `doom/help-search` mentions the `evil-escape` package which user then can google and find how to change that escape sequence.
* I love doom modules. Community has already spent good amount of time tweaking every module and in most of the cases I don't need to do much to reconfigure it.
* LSP module is nice and works with Eglot. What's great is that other modules (like PHP for example) already aware that LSP module can use Eglot and when I open a php file my Eglot just starts and works.
* Evil mode and all keybindings that already configured are incredible.
* General look and feel is way better than I could achieve with my vanilla config.
* Org looks great and evil keybindings are very nice configured. 
* I like the way configuration works and some useful macros provided by Doom 

## What I need to understand/change

* Documentation is sometimes lacking. That's hopefully something I can help with.
* I don't like that LSP/Eglot starts automatically. I do believe "start automatically by default" is a good choice though.
* There are no projectile keybindings and there is no my favorite `projectile-run-vterm`. Easy fix though.
* I don't really understand a point of `+vterm/toggle`. It works great in one project but when I open a second one then this function still opens up the vterm that belongs to that first project.
* `doom/reload-theme` - probably doesn't work on my end. When I set `doom-theme` variable to something else/non-default and then call `M-x doom/reload-theme` nothing changes. I have to use `M-x consult-theme` to actually change a theme. 
* I still need to figure out how to use `after!`. I initially thought that this macro's first argument is something that is mentioned in `init.el -> doom!` call but apparently I should specify an emacs package name there.


## Conclusion

In general, I love the feeling. It took me almost no time to get used to vim keybindings and keep coding like nothing's changed. 
Probably my vim past is already too deep in my muscle memory. I'm glad my emacs past is also quite deep so I feel like I can seamlessly 
switch from one way of editing to another. 
