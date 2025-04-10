+++
date = '2025-04-09T16:47:34+10:00'
draft = false
title = 'Newsticker - Emacs built-in RSS reader'
tags = ['emacs']
+++

I've been browsing Emacs's **The Info Directory** (C-h i) the other day and came across a menu item called **Newsticker**.

Turned out is a built-in RSS reader I never heard of.
I know Emacs has **Gnus** which I tried to use as RSS reader before but didn't succeed.
Then, as probably most of Emacs users, I moved to **Elfeed** which is great.

Here is how Newsticker looks like:

<img alt="hermit logo" src="/assets/img/newsticker-treeview.png" width="100%"/>

isn't it nice? You can open it with **M-x newsticker-show-news**.

It's been a few weeks since I decided to use it.

### Navigation

Navigation is very simple:

- **f** and **F** for switching feeds forward/backward
- **n** and **p** for switching posts
- **\<RET\>** to read full article

### Configuration

Setting feeds is only slightly different from Elfeed:

```lisp
(setq newsticker-url-list '(
  ("Planet Emacslife" "https://planet.emacslife.com/atom.xml")
  ("<name>" "<url>")))
```

Also when **q** is pressed the whole Newsticker is closed BUT its buffers are still there
which I don't really like.

So I came up with this elisp:

```lisp
(defun my/close-newsticker ()
    "Kill all tree-view related buffers."
    (kill-buffer "*Newsticker List*")
    (kill-buffer "*Newsticker Item*")
    (kill-buffer "*Newsticker Tree*"))

(advice-add 'newsticker-treeview-quit :after 'my/close-newsticker)
```
Now when **newsticker-treeview-quit** function is called the Newsticker buffers getting killed too.

### Why use built-in tools

I remember I've read, I think in [Irreal's blog](https://irreal.org/blog/) about not understanding some people's obsession to use built-in tools in Emacs.

I can't quite explain it either but I do feel drawn towards built-in tools too haha.

Naturally I try to track/think about every extension I add to my config
to make sure it's up to date, not abandoned, supports my version of emacs, how much dependencies it has, etc. And even when everything is ok, I still
feel like someone can take it from me if let's say a maintainer will decide to archive the project or something.

It just sits in my brain on the background and slowly drains my energy.
It's maybe silly reason but I just feel more vulnerable with more dependencies.

Anyways, I suggest you to try **Newsticker**, it's very interesting mode.
