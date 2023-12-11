---
layout: post
title: Composer install - ignore php version constrains
description: Ignore php version constrains when installing new packages
tags: php
---

## Solution

Just run this:
```bash
composer install --ignore-platform-req=php
```

## Issue

I often have an issue when after upgrading PHP to a newer versions I can't do `composer install`
anymore because one or more libraries haven't updated their `require.php` section to support
newer version of the language.

Moreover, even if you manage to install new versions of those libs you still may have other
projects on your machine that require older version of php (my case).

I also prefer to have programming languages installed on my machine directly without any docker stuff that would potentially solve this issue. Also I'm not aware of any solutions like NVM or RVM for PHP.

<br>
[Found this info in this post](https://php.watch/articles/composer-ignore-platform-req). Check it out for some more tips.
