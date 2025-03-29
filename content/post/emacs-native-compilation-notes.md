---
date: "2023-04-09T00:00:00Z"
description: Fix (void-variable native-comp-deferred-compilation-deny-list) error
tags: emacs
title: Emacs 29 - Straight.el & Native compilation
---

I just built emacs-plus@29 on my MacOS using `--with-native-comp` just
to see what it is and how it works.

I'll talk about my impression of it later. Let's start with the issue.

I use straight.el + use-package and as soon as I started my
new Emacs instance I've got this:


```emacs-lisp
Debugger entered--Lisp error: (void-variable native-comp-deferred-compilation-deny-list)
straight--build-native-compile((:type git :host github :repo "radian-software/straight.el" :files ("straight*.el") :branch "master" :package "straight" :local-repo "straight.el"))
straight--build-package((:type git :host github :repo "radian-software/straight.el" :files ("straight*.el") :branch "master" :package "straight" :local-repo "straight.el") nil)
#f(compiled-function () #<bytecode 0x13b193a2e77f4e46>)()
straight--transaction-exec(use-package-\"c809124e9c5270ea1c72e2c3507331d1\"-nil-nil :now #f(compiled-function () #<bytecode 0x13b193a2e77f4e46>))
straight-use-package((straight :type git :host github :repo "radian-software/straight.el" :files ("straight*.el") :branch "master"))
load-with-code-conversion("/Users/krydos/.emacs.d/straight/repos/straight.el/..." "/Users/krydos/.emacs.d/straight/repos/straight.el/..." nil t)
load("/Users/krydos/.emacs.d/straight/repos/straight.el/..." nil nomessage)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)) (bootstrap-version 6)) (if (file-exists-p bootstrap-file) nil (save-current-buffer (set-buffer (url-retrieve-synchronously "https://raw.githubusercontent.com/radian-software/..." 'silent 'inhibit-cookies)) (goto-char (point-max)) (eval-print-last-sexp))) (load bootstrap-file nil 'nomessage))
load-with-code-conversion("/Users/krydos/.emacs.d/init.el" "/Users/krydos/.emacs.d/init.el" t t)
load("/Users/krydos/.emacs.d/init" noerror nomessage)
startup--load-user-init-file(#f(compiled-function () #<bytecode 0x155c027c85bc7d>) #f(compiled-function () #<bytecode -0x1f3c61addc0da035>) t)
command-line()
normal-top-level()

```


It looks like for some reason straight.el expects `native-comp-deferred-compilation-deny-list` variable available in Emacs while
this variable was renamed to `native-comp-jit-compilation-deny-list`.

Straight.el's `master` branch doesn't know about the rename but the `develop` branch does.
So to switch straight.el to newer branch we can define `straight-repository-branch` somewhere on the top of our init.el like so:
```emacs-lisp
(setq straight-repository-branch "develop")
```

I also removed my `~/.emacs.d/straight` directory to make sure every other package will be pulled from scratch
and there are no conflicts between my current version of Emacs and the older one (28).

## Native compilation impression

I'm not sure about it. Since I use my own config and I don't include that many packages everything was quite quick
even without the `--with-native-comp`.
With native compilation I don't see the difference, maybe I'll notice it later.

What I noticed is that when I first started my Emacs 29 the compilation process was running on the background (without indication) and
the whole UI was sluggish. Switching buffers was slow, reaction to my keystrokes was delayed, etc.
But in few minutes, I believe when everything was compiled, everything started to work as usual, no delays, no issues.
