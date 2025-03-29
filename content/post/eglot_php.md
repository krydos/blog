---
date: "2022-10-24T00:00:00Z"
description: Make PHP LSP work in Emacs with Eglot
tags: emacs php
title: Eglot & PHP & Phpactor
---

Trying out **eglot** at the moment on a php project I have and unfortunately it doesn't work out of the box.

The issue is that my PHP project is based on PHP8 and [php-language-server](https://github.com/zobo/php-language-server) is pretty old server
that doesn't support new php versions.

There are bunch of other LSPs for PHP and I would like to play with Phpactor which I never used before.

Fortunately **eglot** supports any LSP server and Phpactor has one too.

To make it work just add this to your init.el:

```emacs-lisp
(add-to-list 'eglot-server-programs '((php-mode phps-mode) "phpactor" "language-server"))
````

Make sure phpactor is in your $PATH, otherwise just specify the full path.

Now you can just `M-x eglot` in any php file and it should magically start working.
