---
layout: post
title: git grep --untracked
description: git grep untracked files
---

Turned out I use `git grep` a lot with my VIM (using [EasyGrep](https://github.com/dkprice/vim-easygrep/issues)
plugin). At some point this plugin just stopped to show me all the available results.

Due to lack of explicit `git grep` usage it was pretty mysterious.

The reason is that `git grep` doesn't search in untracked files.
If you want to search in untracked files too just add `--untracked` option to the command like this:

```
git grep --untracked SomethingILookingFor *
```

[Official git grep doc](https://git-scm.com/docs/git-grep)
