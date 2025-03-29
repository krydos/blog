---
date: "2023-04-11T00:00:00Z"
description: Edit in *grep* buffer directly and save changes
tags: emacs
title: Emacs & Wgrep
---

So I just discovered `wgrep` mode of a grep buffer in Emacs and it's incredible.

I often use `projectile-ripgrep` if I need to find something in the project I'm working on.
But if I wanted to rename some variables or strings that I grepped I had to go and manually update them or use something like
`projectile-replace`.

But turns out there is `wgrep` mode that is available from `projectile-ripgrep` (`*rg*`) buffer or from `*grep*` buffer.

In case of you `ripgrep` you just press letter `e` and now you can edit anything you want. Then you press `C-x C-s` and now all the changes
are made. Amazing.

Here is an example. Let's try to find and replace `projectile-` string in this blog:

Here is what was found (image is clickable)


<a target="_blank" ref="/assets/img/emacs-grep-projectile.png"><img alt="grep view" src="/assets/img/emacs-grep-projectile.png" width="550px"/></a>

now I press `e` and I can edit the buffer. It says this in the message area:

<a target="_blank" href="/assets/img/emacs-wgrep-message.png"><img alt="wgrep view" src="/assets/img/emacs-wgrep-message.png" width="550px"/></a>

Now I changed few occurrences of the `projectile-` to `project-` and pressed `C-x C-s` and now those two files are edited without me even visiting them.

<a target="_blank" href="/assets/img/emacs-wgrep-edited.png"><img alt="wgrep save" src="/assets/img/emacs-wgrep-edited.png" width="550px"/></a>

You can save all unsaved buffers with `C-x s`

Incredible discovery. I'm going to use it all the time now.

I'm not sure though what kind of feature is this. It's not a package that I had to install. It's just there and it works.
