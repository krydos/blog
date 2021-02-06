---
layout: post
title: Docker volumes, WSL and Docker for Windows [memo]
description: Windows Linux subsystem and docker volumes
---

Hey.

While I'm on Windows I do use Docker for Windows. It's running on my host machine but I'm running
docker commands from WSL (Windows Linux subsystem).

While running it from there the volumes I'm trying to mount into the container won't work.

So the solution is (assume everything you want to mount is on disk C):

- `sudo mkdir /c` - to create a directory named `c`
- `sudo mount --bind /mnt/c /c` - mount existing `/mnt/c` into `/c`
- `cd /c/path/to/project` - go to the project
- `docker run -it -v $(pwd):/project node bash` - it WORKS!


The solution has been found here - https://github.com/Microsoft/WSL/issues/1854

<3
