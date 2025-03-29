---
date: "2019-08-08T00:00:00Z"
description: Save file in Vim ignoring AutoCmd
tags: vim
title: Vim save file without AutoCmd
---

Vim's **autocmd** is very powerful feature.

In my workflow I have many of them including **autocmd** for **BufWrite**.

There are rare cases when I want to save file and ignore any **autocmd**.

To do this you can just save it by:

```
:noa w
```

Of course there can be any command after `:noa`.

Check `:h noa` for more details.
