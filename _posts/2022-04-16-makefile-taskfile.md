---
layout: post
title: Makefile -> Taskfile
description: Use Taskfile for project aliases
---

## Makefile

I add a Makefile to every project I work with. I don't usually work on C/C++ projects or any other compiled languages but Makefile is good to make aliases for long commands.

Here is an example of short version of Makefile I use:
```makefile

.PHONY: up
up:
	docker-compose up -d

.PHONY: logs
logs:
	tail -f ./storage/logs/*.log

```


There are set of aliases / mnemonics that I used to:
- `make up` - start the project. May be docker-compose or set of commands to turn the project into "running" state
- `make down` - stop everything `make up` did
- `make tags` - generate tags
- `make logs` - watch logs where ever they are

Since I work with multiple languages and frameworks, thanks to this approach, I don't need to remember how to start a project, how to compile JS files, how to read logs, etc... All those commands are hidden under `make` targets.

On the other hand Makefiles aren't designed for such use. `make` is super powerful tool and using it as an alias system just feels wrong.

## Taskfile

Taskfile - is just a shell script where you can define functions to call.

```bash

function up {
    podman-compose up -d --build
}

function down {
    podman-compose down
}

function npm {
    podman run -it -v `pwd`:/app -w /app node:latest npm $@
}

function composer {
    podman-compose exec app composer $@
}

TIMEFORMAT="Task completed in %3lR"
time ${@:-default}
```

Place this file in your project root, make it executable and you can call those aliases with `./Taskfile up` or `./Taskfile composer install`.

To simplify this a bit add this line to you bashrc/zshrc:
```bash
alias run=./Taskfile
```

Now you can call all those commands as `run up` or `run composer install`.
Pretty handy.

This idea was borrowed from [Adrian Cooney](https://github.com/adriancooney) and his [Taskfile repo](https://github.com/adriancooney/Taskfile).

