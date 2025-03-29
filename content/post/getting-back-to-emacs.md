---
date: "2022-05-14T00:00:00Z"
description: Returning back to Emacs with doom
tags: emacs
title: Getting back to Emacs
---

I do change my workflow from time to time to keep myself in shape.

Now, once again, I'm trying to switch back to Emacs. This time I decided to go with Doom. 
I already tried to install use it but it didn't work well for me and I didn't bother to change 
the configuration.

## Main functionalities I need

### Quick search in a project

That's something I used `ag` for in my Vim. I could easily look for a word under the cursor everywhere in the project.

Projectile fortunately have something like this as well and I can search for word under cursor with `SPC-*`.
The issue though is in PHP the word under cursor was including `$` sign which is not want I wanted. 

Fixed by excluding `$` sign from part of a keyword
```elisp
(after! php-mode
  (modify-syntax-entry ?$ "." php-mode-syntax-table))
```

### Git interface

I usually use `git` in terminal to create a branch, for merging, branch switching. 
But I need a quick way to stage files and write commit messages. 

Magit is definitely the suits my needs here.

### Multiple cursors

Doom has `multiple-cursors` package. For some reason it doesn't bind anything and I had to manually bind `M-d` to `evil-multiedit-match-and-next`

### Tasks management / Notes

Well, in Vim I didn't have any good tool for this. I usually switched to Obsidian to take notes.

With Emacs there is org-mode and that's the primary reason why I'm even switching to Emacs right now.

### Projects management

I used Vim with Tmux and every tmux session was created per project. Every session had windows for vim, terminal operations, background jobs. 

In Doom we already have Projectile included. There are also workspaces. 

These two packages are great for managing projects and buffers.

## Issues that I still need to solve

### php-mode is slow

That's something I didn't notice many years ago when I was using Emacs. 
Hard to tell if this is related to Evil mode enabled or some other Doom related configuration but when I try to 
`evil-shift-right` with more than 50 lines selected I have to wait some time for this action to happen. 

### magit is slow

Magit is pretty quick for small editings. But when I have, let's say a merge conflict with a lot of files it takes 
5-10 seconds for magit to open. It obviously depends on exact amount of files to show there but that's pretty painful. 
Of course every other subsequent command is also slow.

### company-mode doesn't autocomplete

Company in my case didn't want to autocomplete by default. The reason was that company backends chosen in doom don't really work at least on 
my projects.

Moreover when I try to set `company-backends` variable to something I need and open a php file the variable updates automatically 
and `company-capf` with `company-yasnippet` is prepended to the list of backends. 

## Summary

Overall Doom experience is pretty nice. Configuration is hard sometimes because Doom sets some package variables, add hooks here and there
and changes configuration of packages to some non-default behavior. 
It makes a bit more complex to setup a package/mode to something I need. 

Maybe I should have chosen Doom in the first place because I already have some habits and needs that I want to have in my editor
while Doom is probably good if you don't have those habits or want to change them. 
