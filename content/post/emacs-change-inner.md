---
date: "2023-01-17T00:00:00Z"
description: use change-inner.el to replace/remove in quotes
tags: emacs
title: Emacs. Change inner/outer like in Vim
---

If you're a former Vim user there is one feature I couldn't find in any other editors.

Not sure what is the proper name of it but let's call it **change inside something**.

Example (`|` - is a cursor):
```javascript
function() {
  return 'hello |world'
}
```
If I press `ci'` the result is going to be:

```javascript
function() {
  return '|'
}
```
or `ci{`:
```javascript
function() {|}
```


That's incredibly useful feature because I don't really need to think where my cursor is.
I just place it somewhere around the place I need to remove and press that magical keybinding.

There is no such built-in function in Emacs. And this one is probably the only feature I miss the most.

For some time I've been using [expand-region](https://github.com/magnars/expand-region.el) by **Magnar Sveen**
which is a different thing really. It just expands a selection by some logical semantic blocks and can be used
as a replacement to that `ci'`.
But still I need to think how many times I should call that `expand-region` function before the thing I need is selected.

So today I discovered [change-inner.el](https://github.com/magnars/change-inner.el) by already mentioned **Magnar Sveen**.
It uses **expand-region** internally and does exactly what `ci<symbol>` does.

Bindings suggested in the package readme, `M-i` / `M-o`, are pretty easy to used to.

So if you ever missed that **change inner/outer** Vim feature give this lib a shot.
