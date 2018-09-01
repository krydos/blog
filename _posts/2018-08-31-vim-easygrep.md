---
layout: post
title: vim-easygrep
comments: true
description: vim plugin easygrep
---

I'm currently trying to use Vim instead of Emacs and one of important workflow I've used to
is grepping things in a project. 

There are few options:

* use `:vimgrep something **/*`. It's pretty long to type so I don't really like it.
* bind that vimgrep command to a key sequence. Which is better but still not ideal. 
* [EasyGrep](https://github.com/dkprice/vim-easygrep). The tool I chose. 

My config looks like this:

```vim
let g:EasyGrepCommand="grep"
let g:EasyGrepRoot="repository"
let g:EasyGrepRecursive = 1
let g:EasyGrepFilesToExclude = "vendor,docker,node_modules"
```

By default EasyGrep use `vimgrep` which is not able to ignore folders as far as I got. 

So setting `grep` as `EasyGrepCommand` makes `EasyGrepFilesToExclude` being considered.

Setting `EasyGrepRoot` to `repository` turns EasyGrep to "search from project root" mode.

Now I can just place my cursor to a word I want to search for, press `<Leader>vv` and that's it. 

Works like a charm.
