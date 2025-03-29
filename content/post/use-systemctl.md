---
date: "2022-04-22T00:00:00Z"
description: systemd - systemctl vs service
tags: systemd
title: Use systemctl instead of service command
---

## TLDR;

`service` is less functional wrapper around `systemctl` command on systemd based distros.

## Details

I'm a long time Linux user and got a habit to start/stop things using `service` command.

I never really thought about what exactly it does. I mean, I know I can start Apache or something else with it and it's something related to init system of my distro.
Usually when you install Apache or PHP-FPM those things become recognizable by `service` command and you can call `service program start` when you want to start a service.

I never really needed to write my own init scripts so I successfully skipped any knowledge related to init systems of various distros I used.

Today I was reading [Fedora Manual for Administrators](https://docs.fedoraproject.org/en-US/docs/) and there are lot of stuff written about systemd and its insisted to use `systemctl` command. Why is that if `service` works too.

Let's close this question.

Turned out `systemctl` is part of `systemd` package/program/init-system. And this is the tool to use when you want to interact with `systemd`.

`service` on the other hand is a script that allows you to start/stop other scripts defined in `/etc/init.d` folder which was used by other init-systems in the past.

Most systemd-based distros provide `service` command for backward compatibility.
At first this command is going to look into `/etc/init.d` folder and if no service found there then it will try to use `systemctl`.

`service` command doesn't support all possible arguments supported by `systemctl`.

So if you consciously decided to use systemd then you definitely should use `systemctl` because it is the command that allows you to interact with `systemd` services.
`service` command behaves like proxy to `systemctl`. Of course it behaves like proxy only if you don't use `/etc/init.d` for your daemons which you probably shouldn't do on systemd based system.

