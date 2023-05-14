---
layout: post
title: Vim folding
description: Vim folding
tags: vim
---

Hi,
I didn't use folding functionality previously at all in any other editors,
but after I watched [this awesome video](https://www.youtube.com/watch?v=oqYQ7IeDs0E) by Greg Hurrell
I found this Vim feature super useful.

So to start getting all benefits from Vim folding just add this to your `.vimrc`:

```vim
set foldmethod=indent
set foldlevelstart=1
```

What these lines do is:

* `set foldmethod` - setting the folding method. `indent` is actually works mostly for all programming
languages. There are other options though (see `:h fold-methods`)

* `set foldlevelstart=1` - this is magic line. It kind of force you to use foldings. Using this line
your files will be folded by default and you have to unfold functions/methods you want to look at.
Value `1` in this case means "fold everything and then unfold it back by one level".

So in case you have class defined then this class will be unfolded and fully visible but all
methods inside will be folded.

Here is the example:


<center><a target="_blank" href="/assets/img/vim-folding.png"><img alt="fun first" src="/assets/img/vim-folding.png" width="100%"/></a>
<small>Please not, in this case I use `set foldlevelstart=2` because class is wrapped in module. </smalL></center>


<br/>


Here is keybindings to fold/unfold your code:

* `zo` - open folded part
* `zO` - open folded part with all sub-foldings
* `zc` - fold the code
* `zM` - fold everything
* `zR` - unfold everything
* `zm` - change fold level (fold everything by one step)
* `zr` - unfold everything (unfold by one step)

Folding mechanism is great in Vim, and actually in every other editors, but I never used it
mostly because I'm too lazy to fold the code.
Since Vim does it for me (`set foldlevelstart=1`) I always have something folded and it's easy
to always remember and use this feature.

Try it!

