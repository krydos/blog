---
date: "2025-02-24T00:00:00Z"
description: null
tags: emacs
title: 'Emacs: glasses-mode'
---

Let's say I have this code (TypeScript) with long **camelCased** variable names.
<a target="_blank" href="/assets/img/typescript-long.png"><img alt="typescript code with long names" src="/assets/img/typescript-long.png" width="600px"/></a>

I'm ok with **camelCase** variables especially if this is a convention for a language.
But at the same time I find it a bit difficult to read compared to **underscore_case** style.

Meet `M-x glasses-mode`.

A beautiful minor mode that is there, built-in, since Emacs 21.
Look what it does
<a target="_blank" href="/assets/img/typescript-long-underscores.png"><img alt="typescript code with long names but this type every name has underscores" src="/assets/img/typescript-long-underscores.png" width="600px"/></a>

The mode doesn't change text in the buffer. It just makes it look like **camelCase** variable names became **underscore_case**.
It is possible to keep editing the buffer and variable names will adjust on the fly. You can use your `M-x rg` or `M-x grep` and they will search for the
text under cursor in **camelCase** because, again, text in the buffer isn't changed.

Amazing.
