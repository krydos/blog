---
layout: post
title: Dropbox direct link to file
description: Get direct link to Dropbox file
tags: dropbox
---

Hey,

Just switched to Firefox and tried to find the way how I can replace the start page.

The only way I've found is use
<a href="https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/" target="_blank">New Tab Override</a>
extension. It allows to set custom html I want to use for start page but other files like css/js and fonts should be linked.

I don't have them anywhere except my Dropbox and of course usual dropbox link isn't working since it opens Dropbox's page
where I can download the file itself.

But there is workaround.

Just copy dropbox link to your file. It may look like this:

`https://www.dropbox.com/s/fy44flf3pw2afsp/thefile.js?dl=0`

and then replace `www.dropbox.com` with `dl.dropboxusercontent.com`.

So the link should look like this:

`https://dl.dropboxusercontent.com/s/fy44flf3pw2afsp/thefile.js?dl=0`

Now you have direct link to your file and you can src it in your html.


P.S.

While I was writting it just realised I can write css/js inline...

<center><img src="https://media.giphy.com/media/wMvESGxZ0Cqd2/giphy.gif"/></center>
