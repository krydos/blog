---
date: "2019-01-18T00:00:00Z"
description: Fix frozen login screen on MacOS when connecting via VNC from Windows
tags: macos
title: VNC, MacOS, and frozen login screen
---

Sometimes my VNC client just shows me Mac's login screen with infinitely
loading animation. If it happens for you too, you can try to login via SSH and run this command:

```bash
sudo pkill loginwindow
```

Now you can try to connect trough VNC and it should work.

Basically it just kills the process of login window and MacOS just runs it again automatically.
