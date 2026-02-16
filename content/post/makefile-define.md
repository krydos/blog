+++
date = '2026-02-16T21:16:31+11:00'
draft = false
title = 'Makefile "define" keyword'
+++

I often use Makefile(s) as a task runner similar to [Justfile](https://github.com/casey/just)
or [Taskfile](https://github.com/adriancooney/Taskfile).

I do sort of understand the concept. I kind of know what target is and what dependencies are.
I also know what **.PHONY** targets are because they are good use case for make targets that are used as tasks.

But I have just discovered something new - the  [define](https://ftp.gnu.org/old-gnu/Manuals/make-3.80/html_node/make_71.html) is.

Turns out **define** is a way in Makefile to define a multi line string.

```text
define multiline_string
hello from
makefile
endef

export multiline_string

.PHONY: print
print:
	@echo $$multiline_string
```

This prints:

```
hello from
makefile
```

<br>

The reason we use **export** is just to make sure we can print it because otherwise make is trying to interpret every line as a command.
But if you don't need to print it and you want to use this multi line string as a file content for example then it should just work.

I think this **define** keyword is pretty neat.
