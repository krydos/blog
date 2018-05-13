---
layout: post
title: Makefile helper for Laradock
comments: true
description: makefile targets for laravel and laradock
---

Hey,
Since recently I work mostly with Laravel and run it with [Laradock](http://laradock.io/)
I've came up with some Makefile targets I use constantly instead of running some commands manually.

Like an example are migration or seed commands, or commands to join php container I can call just
`make run-migrations` or `make join-php` which is faster.


[HERE](https://github.com/KryDos/laradock-helper) is the project repo. Hope it can be useful for someone else too.
