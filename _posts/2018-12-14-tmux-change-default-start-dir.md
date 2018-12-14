---
layout: post
title: Tmux. Change default start directory
comments: true
description: set default start directory
---

Hi, 

if you use tmux you could notice that every time you create new window
it starts in the directory where you initiated your Tmux session.

Usually I start my Tmux at home directory but when I work for a project
I like to have all my windows to be opened in this particular project. 

Sure I can close the session and start the new one from the project directory but... no.

The way you can do it from withing Tmux is press your `<prefix>+:` to open the command mode.

Now enter `attach-session -c <your-default-start-directory>`. 
That's all. 

It works outside of Tmux as well. You can run it this way `tmux attach-session -t <you session> -c <your-default-start-directory>`.
