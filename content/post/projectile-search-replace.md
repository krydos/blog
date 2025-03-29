---
date: "2017-10-20T00:00:00Z"
tags: emacs
title: Emacs Projectile find and replace
---

Projectile is great Emacs package you definitely have to install if you didn't.

Along with projects management and quick switching among of them it allows you to limit grep/ack, find files and replacing commands.
Here I want to note how to quickly search and replace strings in your project.

Search (grep/ack/ag)
------

If you know basics of `grep` you shouldn't get any issues with it. Just call `projectile-grep` interactive function
and type the query.

Here is how it works on this blog with `title:` query:

<a target="_blank" href="/assets/img/projectile-grep.png"><img alt="projectile grep output" src="/assets/img/projectile-grep.png" width="550px"/></a>

As you can see there is new buffer created called `*grep*`. At the bottom it says that search is finished (`:exit`) and have matches (`[matched]`).
Filenames are links, so you can click on them and file will be opened in new buffer on the matched line.

Replace
-------

Projectile is also really great in replacing with its `projectile-replace` and `projectile-replace-regexp`.
When you call one of those functions you will be asked for an input to search for.
Let's search the blog for `Replace`.
When you typed the query, you need to input the string you want to replace on. Let's replace our `Replace` with `Find`.

When both params are entered the buffer with first match will be opened.

You can see the info in the mini-buffer:

<a target="_blank" href="/assets/img/projectile-replace-mini-buffer.png"><img alt="projectile grep output" src="/assets/img/projectile-replace-mini-buffer.png" width="550px"/></a>

Now you can press some keys to perform actions.
Press `?` for help.

<a target="_blank" href="/assets/img/projectile-replace-help.png"><img alt="projectile grep output" src="/assets/img/projectile-replace-help.png" width="550px"/></a>

As you can see if you click `y` button then the replace action will be performed. If you see something wrong is going to be replaced just press `n` button to skip the
currently highlighted match and Emacs will switch to the next match.



Searching and replacing should be used as often as possible with minimum of manual work. It will save you from mistakes and improve your productivity a lot.

Good luck <3
