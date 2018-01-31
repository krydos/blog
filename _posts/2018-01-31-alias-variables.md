---
layout: post
title: Bash. Variables inside aliases
comments: true
description: an issue with variables inside bash alias
---

Hey,

Recently I had to use bash alias that contains `$(pwd)` inside so I've defined it like that:

```bash
alias thename="something $(pwd) --option=value"
```

<br/>

Of course I know a bit of bash so that's why I use double quotes!

<center><img alt="how I feel" src="https://media.giphy.com/media/BrZTIgDc7VmnK/giphy.gif" width="200px"/></center>

But it turned out to be wrong. Each time when my bash/zsh was opened the alias was defined with **INTERPRETED** `$(pwd)`
which is the directory where bash was opened (usualy home dir).

Actually we have to use single quotes to make sure that `$(pwd)` isn't interpreted at the moment of alias definition but it is
when we call the alias.

## Summary

<br/>

- use single quotes if you want to make sure variable/command is interpreted during the alias call.
- use double quotes if you only want to interpretate variable/command on the alias definition stage (and only once).
