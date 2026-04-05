+++
date = '2026-04-05T15:27:44+10:00'
draft = false
title = 'I optimised my blog'
+++

I looked at my blog in the network tab and I saw this:

<a target="_blank" href="/assets/img/blog-before.png"><img width="600px" src="/assets/img/blog-before.png"/></a>

The entire index page with css is smaller than the custom Inconsolata font I was enforcing on my website.

The index page is **24.01KB** (11KB compressed) and the font is **31.7KB** (31.15KB compressed). Total size is **55.71KB**.

I relaised I should **not** override the font of my web site.<br>
Because people may have configured the monospace and other fonts in their system
or just in their browser and I should not interfere with their preferred style of text.

I do understand that font can be a part of visual language of the web site.
I just decided to choose not to use custom fonts as part of my visual language.

## I removed the custom font

That's the only thing I needed to do, so, I stopped downloading Inconsolata and started to use **monospace** as **font-family**.

And here is what happened to the network traffic:

<a target="_blank" href="/assets/img/blog-after.png"><img width="600px" src="/assets/img/blog-after.png"/></a>

**23.91KB** total (10.95KB compressed). 2x improvement. Load time is halved as well!

## It still looks great (even better?)

### Before

<a target="_blank" href="/assets/img/blog-before-ui.png"><img width="600px" src="/assets/img/blog-before-ui.png"/></a>

### After

<a target="_blank" href="/assets/img/blog-after-ui.png"><img width="600px" src="/assets/img/blog-after-ui.png"/></a>

It even fits more posts on the screen now. I think it's a good improvement.
