---
layout: post
title: VIM, project specific settings
comments: true
description: Vim set configuration per project
---

Hey, 
I've just been looking for a good plugin that can help me to configure some VIM variables per project.

For example I want `set shiftwidth=2` for my JavaScript project and `set shiftwidth=4` for PHP one. 

Turned out no plugin needed. 

Just put this to your `.vimrc`:

```vim
silent! so .vimlocal
```

Now if you put `.vimlocal` file to your project root, it will be sourced and "executed".

`silent!` is using to supress warnings when there is no .vimlocal file in a directory.
