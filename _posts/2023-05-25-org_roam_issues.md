---
layout: post
title: A few issues of Org-Roam
description: Org-Roam issues
tags: emacs
---

## Intro

It has been almost a year since I started to use Org-Roam.
I initially migrated from Obsidian even though I was incredibly happy with it.

Recently I started to take more notes than usual and noticed that Org-Roam has some issues
that for me aren't critical but disturbing.

## Issues

### No build-in search functionality

There is just no something like `M-x org-roam-search`.

I'm pretty sure there is no such thing because it's Emacs and you can search any directory you want very quickly
using built-in `grep`, `rgrep` or other tools like that.
And of course you can make a function off of that and then bind it to a key chord you like.

But having such function already there will not force Org-Roam users to add more
lines to their config.

### org-roam-node-insert - don't understand a word at point

`org-roam-node-insert` is very useful. Is how you link notes together.

At the moment when note is typed I usually quickly review it and then connect it to other notes.
In such a case I move my cursor to a word that I'm going to use as a link and type that command.

The minibuffer starts listing all the notes but the "linking word" my cursor is at isn't used.

There is no such issue in case you mark a word and then call `M-x org-roam-node-insert`.

Again, since it's Emacs it should be quite easy to fix.

It would be nice to have it default though. I can't find arguments against it.

### Note creation date

Yes, it is in a file name BUT

if you use grep or even something like consult-grep for searching in your notes you will not be able to
filter your results by a date.

It probably can be fixed with org roam templates.

### Note IDs

I was able to find many complains about it.

For me it's not that serious in terms of fear that my notes and links may stop working
if I loose the roam db (the db is just a cache) or roam is not supported anymore (org files are text).

The main issue for me here is that I can't understand the links if I open my notes in an editor that
doesn't have Org Mode. It sometimes happens. It happens on my Android. It happens on my Windows machine that I barely use and I don't even need Emacs there.

In such a case I see the link with an ID and description of that link which sometimes doesn't exactly match a note file name.

If org format is pure text and intended to be human readable, it's probably should stay this way.

## Conclusion

It should be understood that Org-Roam is open source and community driven. It definitely can be improved as, probably, any software.

The only person I can blame for not implementing those functionalities I mentioned is me.
The project is opened for everyone to contribute (including me) so I hope I can fix those things somehow.
