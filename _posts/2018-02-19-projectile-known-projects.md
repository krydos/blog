---
layout: post
title: Projectile cleanup list of known projects (spacemacs)
description: Way to cleanup list of known projects in spacemacs
tags: emacs
---

Recently I've switched through a lot of different OS setups and my projects list in Spacemacs was bloated.

Some projects were from MacOS, others were from Windows. All of them were not existed anymore.

I've tried to find a file where Emacs (Spacemacs) stores list of projects but I've found even better elisp function
for this.

Just call `M-x projectile-cleanup-known-projects` and every path (project) that is not exists
on your current machine will be removed from the list of known projects.

<center><img src="https://media.giphy.com/media/e1BxgoFxAOmbK/giphy.gif"/></center>

Glad there is such function and my \*spacemacs\* buffer looks much much better now
