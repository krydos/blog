---
layout: post
title: Terminal tips and tricks
comments: true
description: Terminal tips and tricks
---

Hey.

Below I've listed couple of ways to use terminal that some people may not know about.
These "technics" I use a lot in may daily hacking.<br/>
So let's start.

<h2>CTRL+R</h2>
I'm sure you already know that you can travel through command history using ⇧ and ⇩ keys.
But sometimes the command you're looking for is far behind in history so you should do something like this
```
⇧⇧⇧⇧⇧ damn, I missed it ⇩⇩ here is <enter>
```
which is quite annoying.

**CTRL+R** allows you to search through command history. <br/>
Here is the demo:

<a target="_blank" href="/assets/img/ctrl_r.gif"><img alt="ctrl+r gif" src="/assets/img/ctrl_r.gif" width="600px"/></a>

You can go deeper in history with the same keystroke (CTRL+R). To go forward in history press **CTRL+S**

This keystroke I just can't live without and use it all the time.
<br/>
<br/>

<h2>Movements/Editing</h2>
Of course I do not use **CTRL+R** just to find previously entered command
since it can be easily found with ⇧ key. But, I really do not like to move my hands outside of my keyboard's
homerow. Usually all terminals supports emacs keybinding <br/>
So meet:
<br/>
<a target="_blank" href="/assets/img/arrows.png"><img alt="emacs arrows" src="/assets/img/arrows.png" width="300px"/></a>
<br/>

* If you'll replace **CTRL** with **ALT** for arrow left/right keys you will be able to follow back and forth word by word.
<br/>
<br/>
<br/>

Here is more tips:

* You can also use **ALT** key with **BACKSPACE** which will delete WORD instead of SYMBOL.

* You can remove symbol under cursor with **CTRL+D**.

* Using **CTRL+A** will move your cursor to the beginning of the command line

* **CTRL+K** will remove everything from cursor to the end of command line

So, using **CTRL+A** + **CTRL+K** removes everything you already entered, which is much faster than long
press on backspace.
<br/>
<br/>

<h2>CTRL+L</h2>

Just a **clear** command, which clears your terminal window. I like when my typing happens
at the top of terminal window 😜 so it is very useful for me.
I hope it can be something good for you as well.
