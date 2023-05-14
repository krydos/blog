---
layout: post
title: Make list targets [memo]
description: Makefiles and their targets
tags: make
---

Here is small note about the target I put in every Makefile I have.

The target is called `list` and looks like this:

```makefile
.PHONY: list
list:
    @$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
```

It prints list of all targets defined in your Makefile.

Took it from [this brilliant stackoverflow answer](https://stackoverflow.com/a/26339924/1867518 "makefile list targets")
