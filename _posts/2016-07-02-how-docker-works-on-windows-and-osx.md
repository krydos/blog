---
layout: post
title: Docker parts and how it works on Windows and OSX
comments: true
---
<a target="_blank" href="/assets/img/dockerlogo.png"><img alt="fun first" src="/assets/img/dockerlogo.png" width="550px"/></a>

Hi, today I want to tell you about parts of Docker (yes, Docker it is not standalone application). In this article I'm not going describe internals of docker, its filesystem, what is container, image and how to use it. Instead you’ll learn what is docker daemon and docker client and how docker and docker-beta (at the moment of this article it still beta) works on Windows and OSX.

This article is pretty simple with minimum technical terms.

What is docker
===============

Docker is containerisation tools (tool**s** - not a standalone app) that use LXC (Linux containers). LXC is also set of tools that use some Linux kernel's features and that features are available only in Linux kernel.
It means that docker can be used natively ONLY on Linux, period.

I saw people use it on their Windows/OSX machines
================================================

Yeah, I’m sure you saw it.

Let me tell you about the parts that Docker consists of.

The first and probably main part of Docker is **Docker Daemon**. 
This guy is heart of Docker term. He do every job that you know Docker can do
and this guy **is only available on Linux**.

But when you type **docker** in your terminal you actually do not use docker daemon directly,
you invoke **Docker Client** and ask him to pipe commands you typed to the
**Docker Daemon** and Docker Client **is cross-platform tool**.

<a target="_blank" href="/assets/img/docker-client-and-daemin.png"><img alt="fun first" src="/assets/img/docker-client-and-daemon.png" width="550px"/></a>

So, strictly speaking, you saw how people use Docker Client on their Windows/OSX machines. 
They have/had virtual machine installed with Linux inside
where Docker Daemon was running.
Probably they used **docker-machine** which is just interface to the virtual box
or other similar virtualisation tools.

It means also that your containers were not running on your host machine
but on virtual machine which is not cool actually and brings some
issues with networking and filesystem sharing.

Docker Daemon can be running on separated machine and Docker Client
can connect to it by socket.

So this is how docker works on Windows and OSX.

Docker Beta
==========

Couple of months ago Docker team did something cool and their realised
**Docker for Windows and OSX**.
For you, as for Docker user, it means that you can run docker containers
natively on your host and access them via localhost with no issues with filesystem sharing.

But, it is not really truth.

<a target="_blank" href="/assets/img/you-lied.jpg"><img alt="fun first" src="/assets/img/you-lied.jpg"/></a>

**Docker Beta** is still using virtual machines. 
On Windows it uses Hyper-V and on OSX it uses xhyve. 
Both are native for their platforms and were developed for one platform with platform-specific features.
When you run Docker.exe or Docker.app the virtual machine will be started and you can forget about it at all,
you no need to set socket address in your docker client or do something else.
You can just run the app and start to use Docker. 
Internally it uses Linux with Docker Daemon installed but you will not see it at all.
That’s awesome and for Docker users it looks like it works natively. 
Every port of you application (that is exposed of course)
can be accessed on localhost, you can share any part of your filesystem 
with no issues.

Probably Docker will never be available on Windows and OSX natively because Docker is using Linux kernel features and these feature are not available on other platforms. But it doesn’t mean you can’t use Docker on Windows or OSX for your development needs.

I didn’t describe a lot of internals of docker in this article, maybe I will do it in next one, but I really hope it brought some light to the how Docker and Docker Beta works on your machine.

Have a good day and always know how your tools are working.
