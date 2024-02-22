---
layout: post
title: "Emacs: Did you know about IBuffer?"
description: Emacs ibuffer is enhancement of Buffer Menu
tags: emacs
---
## The problem
Sometimes I use `C-x C-b` to get list of buffers so I can
clean it up a little after some time.
To do it I mark some buffers with `d` (to delete) and then press `x`.

Today I wanted to filter that list of buffers to a particular project/folder and turned out I can't. <br>
There is no way to filter **\*Buffer List\***.<br>

## IBuffer
If you look up for Buffer Menu in EmacsWiki you'll find the [Enhancements section](https://www.emacswiki.org/emacs/BufferMenu) which mentions `IBufferMode` which is built-in since Emacs 22.

This mode is literally Buffer Menu on steroids. Looks pretty much the same so from UI perspective you'll see no changes (almost).

To filter buffers by directory just type `/ F` and enter the project/folder name.
The only thing left is `C-x h d x` to mark all buffers and delete them.<br>
To remove all the applied filters just do `/ /`.

The number of filtering commands available by default is great.<br>
You can find them by `C-h m` (describe-mode) and then look for "Filtering commands" section. Go through other sections as well to get more familiar with ibuffer capabilities.

## Doom & Spacemacs
If you're Doom user you probably already enjoying this mode since it's enabled by default.<br>
In Spacemacs you can enable it by turning on `ibuffer` layer.

Both of these config distributions remap standard `C-x C-b` to call `ibuffer` and I suggest you do the same if you use custom config like me.
