---
layout: post
title: Org-mode archive with inherited tags
description: Archive org headings with inherited tags
tags: emacs
---

## The issue

By default only the tags directly attached to an org record will be saved in the archive file.
I want to keep all the tags attached to an org record when I archive it, even the inherited ones.

## Explanation
In org-mode tags are inherited by default. In case of org tree like this:

```markdown
* Header1        :tag1:
** Sub Header1   :subtag1:
```

you may find that **Sub Header1** has `:tag1:subtag1:` tags attached to it.

This is something reflected in Agenda view.
Also if you try to find headers with `:tag1:` <br/>the **Sub Header1** will be one of those even though
we didn't directly attach that tag to it. That's the tag inheritance.

If you try to archive **Sub Header1** you will get this kind of record in the *_archive.org file:

```markdown
* Sub Header1
  :PROPERTIES:
  :ARCHIVE_TIME: <date>
  :ARCHIVE_FILE: <original org file>
  :ARCHIVE_OLPATH: <org path>
  :ARCHIVE_CATEGORY: <org file category>
  :ARCHIVE_ITAGS: subtag1 <------------ this is the tag
  :END:
```

As you can see the `tag1` is missing in `ARCHIVE_ITAGS` property. In my case it messes up with org records context for me and when I refer to
archive file I can't quickly understand where was that org record in the original file.

## Solution

```emacs-lisp
(setq org-archive-subtree-add-inherited-tags t)
```

It's as easy as that. Now the archived `ARCHIVE_ITAGS` will look like this:

```markdown
:ARCHIVE_ITAGS: tag1 subtag1
```

which is exactly what I wanted.
