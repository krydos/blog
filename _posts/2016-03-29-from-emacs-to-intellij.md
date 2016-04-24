---
layout: post
title: From Emacs to Intellij IDEA
---

Recently I switched from Emacs, which I used about two years, to IntelliJ.
It was pretty hard switch since my muscle memory wasn’t happy. Thanks guys from JetBrains they have Emacs keybinding-scheme.
Today I will try to describe how I configured IntelliJ to be more Emacs-like.

First of all IntelliJ interface is pretty overloaded. Emacs had only text area with status line and mini buffer. I found very nice instructions about how to do interface more minimalistic in Laracast video. It was for PHPStorm but it also work for IntelliJ.

So, lets start.

* I do not really use status bar at the bottom of window. If you no need it you can also remove it by checkbox in **View -> Status Bar**.
* Navigation bar on top of window. Go to **View -> Navigation Bar** and uncheck it.
* Toolbar. A lot of buttons for guys who use mouse. Go to **View -> Toolbar** checkbox.
* Breadcrumbs probably useful feature, but I do not see a reason to use it. To disable it lets go to **Preferences -> Editor -> Appearance**. Uncheck **Show HTML breadcrumbs** (restart of IDE may be required).
* Tabs. Emacs has buffers. IntelliJ has “Switcher” that contains list of recently opened files. It exists by C-x C-b. Let’s remove tabs by right click on it and select **Tabs Placement -> None**.

Now it should look something like this:

<a target="_blank" href="/assets/img/idea-now.png"><img alt="idea now" src="/assets/img/idea-now.png" width="750px"/></a>

Much much better, right? ;)

Since I develop mostly backend and various APIs I used to use **restclient-mode** in Emacs.

Intellij has something similar. Tool called **Test RESTful Web Service**.

<a target="_blank" href="/assets/img/test-api-tool.png"><img alt="test api tool" src="/assets/img/test-api-tool.png" width="750px"/></a>

It has pretty much all features required by me, but it still sucks compared with restclient-mode of Emacs. There are not too much keybindings (actually only ⌘ + Enter is known and frequently used by me). You can add parameters, headers, you can repeat your last (or long before) query. It sucks mostly because too much mouse involved in the process of this tool usage.

Next thing its a **terminal**.
The replacement of M-x shell called – **Terminal**. It’s very functional and looks better than Emacs eshell or term modes. I can even run Emacs inside.

<a target="_blank" href="/assets/img/idea-term.png"><img alt="idea term" src="/assets/img/idea-term.png" width="750px"/></a>

I mapped it to C-c C-t to make it more accessible. I usually use it for files creation (instead of the IDE’s sidebar and mouse right click).

Hope it was useful. Don’t forget to switch your keybinding scheme to Emacs mode.
