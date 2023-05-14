---
layout: post
title: Ruby's bundle exec [memo]
description: Bundle exec and local ruby packages/gems
tags: ruby
---

Hey.

I mostly use PHP or Node.js and sometimes I have to touch Ruby projects.

I know I can run `bundle install` to install deps from Gemfile but I was unable to find them in the project directory.

It turned out the reason is they are installed globally. It doesn't fit my needs sometimes so I had to find the way to install them locally.


They solution is:

- `bundle install --path=./local-dir-name`


it will install packages into local directory but you were not be able to call binaries. Ok...

The solution for this is to run binaries via `bundle exec` like so:

- `bundle exec jekyll serve`


Works perfectly.
