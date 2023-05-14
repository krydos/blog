---
layout: post
title: Org Agenda - show archived records by default
description: Emacs & Org Agenda - show archived records
tags: emacs
---

If you didn't know, there are two methods of archiving subtrees
in Emacs' Org-mode.

- Internal archiving (mark an item as ARCHIVED but keep it in the file)
- Moving subtrees (move an item or subtree to *_archive.org file)

I often use the latter but the issue here is that all my items
got disappeared from Org Agenda view when archived.

You can tell Org Agenda to show archived records by pressing
`v A` in `*Org Agenda*` buffer.
Notice upper-cased `A`. If you use lowercase `a` then only internally
archived records will be shown.

What `v A` does is it calling `(org-agenda-archives-mode 'files)`
which internally sets `org-agenda-archives-mode` variable to `t`.

This is what we can do in our `init.el`:

```emacs-lisp
(setq org-agenda-archives-mode t)
```

Done!
