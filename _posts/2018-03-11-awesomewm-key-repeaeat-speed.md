---
layout: post
title: AwesomeWM change key repeat frequency
description: How to increase speed of a key to repeat
---

Hi,

Switching from Gnome3 to AwesomeWM I've noticed that key repeat frequency
is lower on AwesomeWM.

To fix this you can use `xset` tool (check `man xset`). The tool allows you to
set various options for x server. Key repeat frequency is one of those.

Just execute this in your terminal `xset r rate 220 25` and
you will immediately see the effect. Find the best parameters for you and
then add this line to your `rc.lua` (if you don't know where to add it just add it to the bottom):

```lua
os.execute("xset r rate 220 25")
```
<br/>

<3
