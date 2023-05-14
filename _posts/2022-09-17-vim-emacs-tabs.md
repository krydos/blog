---
layout: post
title: Vim Tabs in Emacs
description: Usage of tabs in Emacs and Vim
tags: emacs vim
---

Immediately few things to mention.

First: we're going to talk about Tabs as in "UI element". Not indentation.
<br/>
Second: Tabs in Vim and Emacs are not supposed to be used as tabs in many other editors.

## Vim Tabs

Vim tabs aren't supposed to be tabs similar to other editors where you have a file per tab and then switch those tabs with your mouse (???!). There are buffers for that.

Vim tabs were designed to hold "workspaces" or logical group of files/buffers/splits, quickfix windows or other "vim ui" elements.

For instance you may be working on a project issue and you have your tests in one split and actual code in another. Maybe some docs in 3d one.

Now somebody in your company chat asks for a help and you as a nice person want to take a look.
<br/>
You do `:tabnew` and new fresh "workspace" is opened. You then go to a file your colleague was asking for, view it, open one more split for tests or docs, vimgrep for stuff and it's all happening in new fresh "workspace". When you're done you just do `:tabclose` and you're back to you first main workspace with your 3 splits where everything is untouched **which smooths context switching a lot**.

## Emacs Tabs
Switching to any editor from Vim I always felt missing Vim-like tabs functionality and I felt the same in Emacs too.
Fortunately starting with Emacs27 we have few tab modes built-in and one of them is `tab-bar-mode` (default prefix `C-x t`)

Turns out I can use `tab-bar-mode` pretty similarly to vim tabs.

The only difference is in Vim when all but one tab is closed the tab-bar gets hidden. Emacs tab-bar dosn't do it.

But fortunately it's Emacs so add this advice to your `init.el` and now tab-bar gets hidden when there is only one tab left.
```elisp
(advice-add 'tab-bar-close-tab
            :after
            (lambda (&rest r) (if (= 1 (length (tab-bar-tabs)))
                                  (tab-bar-mode -1)))
            '((name . "hide-tabbar-if-one-tab")))
```

In case you don't like how Emacs tabs look or behave you can try [https://depp.brause.cc/eyebrowse/](https://depp.brause.cc/eyebrowse/) package that sounds the same to me but its "tabs" are shown in the modeline.

Its styles probably can be customized but with my theme and modeline there is no way to understand what "workspace" is currently active.
<br/>
On the other hand tab-bar is also looking pretty bad (which is also customizable).
