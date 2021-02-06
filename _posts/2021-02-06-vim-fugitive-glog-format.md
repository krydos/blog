---
layout: post
title: Vim Fugitive. :Glog - show a commit author
description: custom format for Vim Fugitive :Glog command
---

TL;DR
====

`let g:fugitive_summary_format = "%<(16,trunc)%an || %s"`

The path of figuring that line out
====

Vim-Fugitive is a great package. Recently I started to use :Glog command a lot to look at range of changes added to a branch after git pull.

```
:Glog <hash>..<another hash>
```

By default the command only shows a commit hash and its subject.

<a target="_blank" href="/assets/img/vim-fugitive-default-glog.png"><img alt="vm screenshot" src="/assets/img/vim-fugitive-default-glog.png" width="600px"/></a>

I really wanted to see how can I show a commit author name as well.

`:h fugitive` didn't help much.

Inspecting the fugitive's source code I came across not documented `g:fugitive_summary_format` variable.
Initially it wasn't clear how to use it what values I can assign to it but then I noticed that it is assigned with values like `%s` or `%h %P\t%H`.

These things looks familiar. `man git-log` - the place those control symbols can be found at.
Searching by "author" gives us `%an` that we can use.

Let's do `let g:fugitive_summary_format = "%an"` and see how does it look.

<a target="_blank" href="/assets/img/vim-fugitive-author-only.png"><img alt="vm screenshot" src="/assets/img/vim-fugitive-author-only.png" width="600px"/></a>


Nice... no commit message. By searching in `man git-log` I found `%s` which is a subject (first top line) part of a commit message.

Let's do `let g:fugitive_summary_format = "%an\t%s"`  (separate name and subject with a tab symbol)

<a target="_blank" href="/assets/img/vim-fugitive-author-subject-no-aligned.png"><img alt="vm screenshot" src="/assets/img/vim-fugitive-author-subject-no-aligned.png" width="600px"/></a>


Better but subject is not vertically aligned so let's keep reading `man git-log`.

There is a subject **Placeholders that affect formatting of later placeholders** where you can find this scary expression - `%<(<N>[,trunc|ltrunc|mtrunc])`<br/>
The definition of this scary thing is - **make the next placeholder take at least N columns, padding spaces on the right if necessary**.

Exactly what we need.
Let's try to use it:

`let g:fugitive_summary_format = "%<(16,trunc)%an || %s"` - here I assume 16 chars in user name is enough for me to recognize an author.
Adding || too as a separator between author and subject.


<a target="_blank" href="/assets/img/vim-fugitive-author-subject-aligned.png"><img alt="vm screenshot" src="/assets/img/vim-fugitive-author-subject-aligned.png" width="600px"/></a>


Much better!
