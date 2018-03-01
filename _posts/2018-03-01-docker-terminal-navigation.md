---
layout: post
title: Docker detach keys
comments: true
description: docker, broken ctrl-p
---

If you like me and use CTRL-P/CTRL-N instead of arrow keys to navigate through command history, you should be disappointed
on how CTRL-P works in docker terminal (the one you see after docker run, docker exec).

It turned out CTRL-P is used for what they call detaching from terminal, which I didn't know about even.

So basically when you press CTRL-P the terminal is waiting for another key press (CTRL-Q in current case). That's why CTRL-P
works in strange way.

The issue <a target="_blank" href="https://github.com/moby/moby/pull/15666">was solved</a> couple of years ago.

What you need to do is create `.docker` folder in your home directory (`mkdir ~/.docker`) and create `config.json` file there with this content:

```json
{
    "detachKeys": "ctrl-@"
}
```
<br/>
You can use other keys of course but CTRL-P should work as usual right now.
