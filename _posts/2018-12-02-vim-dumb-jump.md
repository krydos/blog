---
layout: post
title: Vim, dumb-jump
comments: true
description: Emacs dumb-jump for Vim
---

hi everyone, 

I'm currently using Vim in my day to day work, and if you don't know I migrated from 
another perfect editor called Emacs.

It was pretty easy to migrate since I used evil-mode in Emacs but the only library/plugin
I miss is [dumb-jump](https://github.com/jacktasia/dumb-jump) which is brilliant because
allows you to jump to definition without any CTAGS/GTAGS. 

There is brilliant guy [Chris Paul](https://github.com/bounceme) who made `dim-jump` plugin which does the same as `dumb-jump`.

Moreover the plugin is using `dumb-jump` rules and download them at the first usage of the plugin. 

Just add

```
Plug "bounceme/dim-jump"
```

to your `.vimrc`/`init.vim` and have fun.

The plugin currently just jumps to the first most relevant definition found which is not always correct for me. 

In case you need a fixed version which shows you all possible founds add my fork to you `.vimrc`/`init.vim` file:


```
Plug 'KryDos/dim-jump', { 'branch': 'krydos-adaptation' }
```

I'll update this post as soon as my changes will be accepted by Chris, 
otherwise choose between these two versions of plugin depending on your needs.
