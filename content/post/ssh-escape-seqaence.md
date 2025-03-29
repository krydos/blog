---
date: "2017-10-27T00:00:00Z"
tags: ssh
title: SSH escape sequences or how to quit frozen SSH connection
---

Hey,

So your SSH session has been frozen? Here is what I was doing when it happened.

<a target="_blank" href="/assets/img/ssh-baboon.gif"><img alt="ssh frozen gif" src="/assets/img/ssh-baboon.gif" width="550px"/></a>

The actual thing that should be done is press:

- `Enter`
- `~` (tilda)
- `.` (dot)

Welcome back to your local machine.

The actions performed are called **Escape Sequence**.

SSH is just a shell tunnel between you and another machine.
The SSH client pass all keys sequence, including key bindings, to the server.

So if you want to press `CTRL+c` to kill the running app it will be killed
on the remote machine instead of killing the current SSH client.

Special key sequences allows you to get reaction directly from SSH client
instead of an app on remote server.

If you want to see all possible sequences just press:

- `Enter`
- `~`
- `?`

<br/>

```text
Supported escape sequences:
 ~.   - terminate connection (and any multiplexed sessions)
 ~B   - send a BREAK to the remote system
 ~C   - open a command line
 ~R   - request rekey
 ~V/v - decrease/increase verbosity (LogLevel)
 ~^Z  - suspend ssh
 ~#   - list forwarded connections
 ~&   - background ssh (when waiting for connections to terminate)
 ~?   - this message
 ~~   - send the escape character by typing it twice
```
<br/>
<br/>
I'm actually do not use any of them (except `~.`). Maybe you'll find some of them useful.

<3
