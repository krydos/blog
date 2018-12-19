---
layout: post
title: Vim, format JSON file
comments: true
description: Format JSON file in Vim
---

I have to note it, it's just brilliant!  

If you want to format a JSON file opened in Vim then just run 

```vim
: %!python -m json.tool
```

Stolen from this awesome post - [Format JSON in Vim using Python's json.tool module](https://blog.realnitro.be/2010/12/20/format-json-in-vim-using-pythons-jsontool-module/)
