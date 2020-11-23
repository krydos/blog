---
layout: post
title: My Windows development environment setup
comments: true
description: My Windows development environment setup. My dev workflow.
---

The title is a little bit misleading though. I have almost nothing dev related on my Windows machine and use Linux VM instead.

Here is the components my dev environment consists of:

- VMware Workstation (VirtualBox would work too)
- Windows Terminal
- Vim (NeoVim to be precise)
- Tmux and Tmuxinator

## VMware Workstation

The actual product doesn't matter here. As I mentioned earlier VirtualBox would work as well.
I use VMware because I used to it and I blindly believe in rumors that it is faster than VirtualBox.

Along with some virtual machines I installed out of curiosity there is my main virtual machine configured.
I call it **Workstation** and I store there everything work/personal projects/this blog related.

The workstation is driven by **Ubuntu Server** with no Xorg installed. Whenever I need to run graphical Linux app I use VcXsrv.

One more thing worth to mention is that network in the workstation is configured with NAT
so I always know IP address of the VM regardless the network my laptop is connected to.
Even if my laptop has no internet connection I still can connect to my VM with no issues and can keep working.

<a target="_blank" href="/assets/img/vm.png"><img alt="vm screenshot" src="/assets/img/vm.png" width="600px"/></a>

The VM is always in such state because I connect to it with SSH
so I keep it in a separate virtual screen and if I need to suspend or wake it up I just do
a "four finger swipe" to switch to the screen with only VMware running.

**Why not WSL1/2**

I love WSL. I also like how WSL team switched to VM approach for their WSL2.
WSL just doesn't fit my workflow. I like to fire up the VM, work and suspend it so I can wake it up again when needed in a second
and continue from exactly that state I stopped in.

To stop WSL I literally need to stop all the main process like Nginx, Postgres, Tmux. Tmux idea is to be never stopped.

I don't want to keep WSL's VM running all the time.

So, even though I like the idea of WSL I can't use it.

## Windows Terminal

The reason I use it is I haven't found anything better. It's pretty lightweight, quick and configurable.

It has some issues with default configuration (CTRL+C copies text instead of process termination), Alt+Backspace doesn't remove a word (at least by default)
and some other small issues that can be fixed.

UI is super configurable too. I was able to remove tabs and scrollbar to make UI clean.

<a target="_blank" href="/assets/img/windows-terminal.png"><img alt="windows terminal screenshot" src="/assets/img/windows-terminal.png" width="600px"/></a>


## Vim/NeoVim

I tried lots of editors and I constantly switch from one to another but Vim is definitely the one I spent most of the time in directly or implicitly
(evil-mode in Emacs, VsCodeVim, Vintage in Sublime, IdeaVim in IDEs from JetBrains).

I'm very much used to it and to its keybindings.

You can find my vimrc <a target="_blank" href="https://gist.github.com/KryDos/24484288f4b80a4d60c4135b62f2ee84">HERE</a>

It also plays nicely with Tmux.

<a target="_blank" href="/assets/img/vim.png"><img alt="vim screenshot" src="/assets/img/vim.png" width="600px"/></a>


## Tmux

A window manager for my terminal.

- I run one session per project
- Most of my sessions have 3 windows
  - bg - first window is for background jobs like npm watch, artisan serve, rails server
  - vim - I code here
  - cmd - a window I use to run some git commands or read logs or install missing libraries.
- I use panes occasionally when I need to start two background jobs for example.

I use Tmuxinator for every project I have.
In case I had to restart my VM I can execute `tmuxinator project-name` and I automatically get
a new session with 3 windows created and Vim window focused with all background jobs required by the project running.

**So why do I need Windows at all if all my coding stuff are in Linux.**

Shortly - I like how Windows work.

- I like how any device connected to my laptop is recognized and don't require additional attention and configuration.
- I got much more Kernel Panics and frozen X servers in Linux than I got BSODs in Windows.
- I need Excel sometimes (LibreOffice is far behind).

