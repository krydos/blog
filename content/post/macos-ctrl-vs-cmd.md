---
date: "2026-04-04T00:00:00Z"
draft: false
tags: macos linux windows productivity
title: CMD vs CTRL philosophy on macOS vs Linux
---

I think macOS keyboard shortcut philosophy is superior to Windows or Linux.

## I don't like Linux shortcuts

They are very much the same as the Windows ones - which is funny considering the history between the two.

The shortcuts are absolutely disrespectful to my hands. I have to move my palms constantly to do things.

## Examples

### Firefox (and other browsers) on Linux vs macOS

On Linux, if I type my query into the URL bar, get some records from history or search, and want to select a particular one, what should I do?

*Press Tab* — this one is alright, not too bad. This will select the next candidate in the suggested list. But what if I want to select the previous one?<br>
*Press Shift+Tab* — yeah, OK, I can't do it without moving my palms.<br>
*Can you just use the arrow keys?* — No, I cannot, because it requires moving my palms as well. It's unnecessary.

On macOS I can use readline style shortcuts with Control. I can press **Ctrl+n** or **Ctrl+p** to navigate down and up among the elements.

### Any input

How do I control my cursor position on Linux when I type? I use the arrow keys. There is no other way. I can use some global remappers, but they break other things. They are alien to the system.

On macOS I can just press **Ctrl+b** to move backward or **Ctrl+f** to move forward. It's so much easier and more comfortable.

## It's just a matter of habit

It isn't.<br>
Humans can get used to anything, sure, but there is no need to waste this adaptation resource. How is it possible that we accepted **Ctrl+Shift+Tab** as a key binding to switch tabs in our browsers on Linux?

Humans can't press it comfortably.

## I wish Linux would utilize the Win key more

It would be such a great improvement. **Ctrl+n** in Firefox on Linux always spawns a new window.
It's so painful. Why not make it **Win+n** to spawn a new window?

Or when I type something in Thunderbird, wouldn't it be great to just press **Ctrl+b** to quickly go backward to fix a typo?<br>
Hands don't move - only the fingers.

## There are no fixes to it

GNOME, for example, has Emacs mode, which doesn't work in some applications, including Firefox.

Firefox has the ability to remap the modifier key (from Control to Windows key), but it only works in Firefox and breaks a bunch of other things.

There are quite a few programs that can help solve this, but they aren't perfect (far from perfect, in fact). They require so much attention and configuration, and will break as soon as you install a new application that has its own shortcuts implemented in a weird way.

The only way would be to fix it at the fundamental level: maybe X11 / Wayland (although Wayland doesn't handle keypresses, does it?).

Maybe one day.
