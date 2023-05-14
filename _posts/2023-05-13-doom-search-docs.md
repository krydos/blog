---
layout: post
title: Doom Emacs Search Documentation
description: Doom Emacs builtin documentation search
tags: emacs
---

Just a quick note on how easy it is to actually navigate Doom Emacs documentation and modules.

I initially was a little afraid that I will not be able to understand what each Doom module does
and there always will be some hidden functionaltiy that will be hard for me to find.

Fortunately there is M-x `M-x doom/help-search-headings` that allows me to search through
Doom documentation. Specifically it allows me to search through org headings of the documentation.

I can easily find a module I'm interested in, let's say `lsp`.
Then I'll go there and I can see all the documentation of the module. I can see what packages will be installed and what configuration
options available for the module (e.g. `+eglot` for `lsp`).
Being in the `README.org` of a module I can also open `config.el` which is in the same directory and I'll be able to inspect
all the Elisp that module will add into my Emacs.


If you'd like to search not just headings but everything then `M-x doom/help-search` is your friend.

I start to like Doom more and more every day.
