+++
date = '2025-03-30T14:04:19+11:00'
draft = false
title = 'This blog has been migrated from Jekyll to Hugo'
+++

I have migrated this blog to Hugo yesterday.

It was fun journey and I spent about 5 hours doing it.

## Why change

Recently I bought a relatively cheap laptop which I decided to use as my "Productivity Laptop". I have
Void-Linux installed and I only run Emacs and Firefox on it. There are more to it but that's maybe a story
for another blog post.

Long story short one of the outcomes of using that productivity laptop is [my Gemini server written in Zig](https://github.com/krydos/gemini-server).
When I wanted to write [a blog post]({{% ref gemini-server-zig %}}) about it on the same laptop I found that I have to:

- install ruby
- install gem and bundler
- install jekyll and its dependencies

Instead I could also "just" install docker/podman and use Ruby or even [Jekyll specific container](https://hub.docker.com/r/jekyll/jekyll).

I felt like it's just too much for a simple task as writing a blog post.

## Why Hugo

It's just a single native binary. Everything I mentioned in previous section is solved by just this single native binary.

I did have an idea to use Emacs org-mode for blogging or even write my own static site generator tailored specifically for my needs.
The latter was especially tempting but I'm glad I didn't go this path. Would've taken more than 5 hours for sure.
I also generally try to resist Emacs power of seducing me into using it for everything.

## Migration - easy parts

Hugo has `hugo import jekyll` command which basically copies all the posts and assets into Hugo's folder structure.

`hugo new theme` - is for generating a new color theme to use for the blog. This is where all the css and html layout is defined.

I just had to migrate all the html/css into that new theme.

## Migration - not that easy parts

### Code highlighting

Code highlighting is a bit different in Hugo as in different css/html is generated for it. I still haven't fixed it properly but it's not that
bad at the moment.

### URL schema

URL style is completely different in hugo and I had to make the URL schema the same as in Jekyll because of links to my blog
in the internet. Plus I didn't want to disturb search engines.

There is a way to define `url` property in every post to customize it but doing it for every post sounds strange.

Fortunately hugo allows to configure it.

```toml
[permalinks]
  [permalinks.page]
    post = '/:year/:month/:day/:contentbasename'
```

This is how I did it. `post` is the folder name where I keep all my posts.

### RSS

Fortunately hugo generates RSS automatically and has a feed per tag too.

On of the issues is that my Emacs RSS feed is shared with Sacha Chua's [planet.emacslife.com](https://planet.emacslife.com/).
It means that the URL to that feed must have staid the same and Hugo default path for generating RSS for a tag is completely different from Jekyll.

To fix it I had to generate `./content/tags/emacs/_index.md` file with this content:

```markdown
---
url: 'feed/by_tag/emacs.xml'
description: 'Posts about Emacs - the best text editor'
---
```

it made Hugo to generate rss feed for this particular tag at that particular URL I specified.

## Result

There were and still are a few nice things I'd like to do but in general the migration went smooth.
I'm writing this post from my productivity laptop and the only thing I needed to do is download
[hugo binary from the release page](https://github.com/gohugoio/hugo/releases)

This migration also gave me opportunity to remove all `scss` files that I used only for keeping variables in (css is now fully capable of that),
remove some unused styles and review the whole html layout of this blog.

I'm quite happy with the outcome.
