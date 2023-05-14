---
layout: post
title: Doom Emacs - Turn LSP off by default for PHP files
description: Turn lsp off by default in doom emacs
tags: emacs
---

I'm trying to get used to Doom Emacs and one issue I have is that LSP (in my case Eglot) starts automatically
when I open up a php project.

I don't really like it because sometimes I open php files that I don't need autocompletion for
and I don't want to remember that there is Eglot process now running that I have to stop to save some resources of my laptop.

It happens because I have defined `php` module in `init.el` as `(php +lsp)`.
The reason I have it defined like this is because I need LSP.
I just don't want to start it automatically every time I open a php file.

I like how easy it is in Doom to inspect the module implementation so I went to Doom's `modules/lang/php/config.el` and I found
that there is no flag that can force LSP to not start automatically.

What it has though is this line:

```emacs-lisp
(add-hook 'php-mode-local-vars-hook #'lsp! 'append)
```

It looks to me like something that starts the LSP automatically. It looks like this mostly because everything else looks pretty much unrelated to LSP.

Since there is no flag, let's solve it in our own config by directly removing that `lsp!` piece from that variable:

```emacs-lisp
(after! php-mode
  (remove-hook 'php-mode-local-vars-hook #'lsp!))
```

This will remove that `lsp!` piece from `php-mode-local-vars-hook` and now LSP won't start automatically.

It would make sense probably to add such a flag so users can easily turn off the auto-LSP but at the same time solution to this
is just one line so maybe it wouldn't make sense to add it.
