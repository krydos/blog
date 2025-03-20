---
layout: post
title: "Gemini Server in ~150 lines of Zig"
description: "Gemini (protocol) Server implementation in ~150 lines of Zig"
tags:
---

I've been running my [Gemini capsule](gemini://g.codelearn.me) for a few years
and also recently I got interested in Zig programming language.

Combining these two facts I came up with [this Gemini Server implementation](https://github.com/krydos/gemini-server) that is
about 150 lines long (including comments).

## What I like

Actually, the original idea was to implement it in Rust. And I started it in Rust.
But after a few hours (spanned across multiple days) of writing Rust I felt like
whatever I want to do is not acceptable and there is the only one correct path to do things
(and Rust compiler will happily guide you).

It's not bad. Just not fun.

As soon as I switched to Zig the whole process just started to feel better.
I felt so much relief and there were even days when I woke up earlier before work
to write some Zig.

There are many articles about pros and cons of Zig so I'm not going to list them again (almost) but
I want to note that the language is a joy to work with and I haven't felt that much fun in a long time.

Exploring its source code and std library is another incredibly fun experience. It's super clean and understandable.

It also feels very safe to write it.
It has optionals, error types, enums. The compiler will tell you if you forgot to handle an error somewhere.

## What I didn't like

The only thing I didn't like is how slow the compilation is. It's just annoying.

Although the Zig itself is quick. The iterative approach when you try to compile a program, see error, fix error and repeat is
working completely fine in Zig. They even have `zig build --watch` which is very handy.

The slow part comes in when everything is fine and there are no errors. As far as understand as soon as LLVM gets involved the things gets slow
and LLVM is involved if there are no errors in your Zig program.
