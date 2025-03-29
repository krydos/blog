---
date: "2019-06-24T00:00:00Z"
description: How to open tmux automatically on login via ssh
tags: tmux ssh
title: Open Tmux on ssh login
---

Here is few lines you need to add to your .bashrc/.zshrc/.whatevershellrc:

```
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux attach-session -t mysession || tmux new-session -s mysession
fi
```

These lines check if tmux session `mysession` is exist then we `tmux attach-session`
is executed. Otherwise new session with `mysession` name is created.

Replace `mysession` to something more meaningful.
