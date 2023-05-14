---
layout: post
title: VirtualBox get IP of VM (cli)
description: VirtualBox get IP of VM with guestcontrol
tags: virtualbox terminal
---

Here is command to run from CLI to get `ifconfig` output on guest machine (with ubuntu server):

```bash
vboxmanage guestcontrol <vm name> run --exe '/sbin/ifconfig' --username <username> --password <pass>
```
<br/>
**Make sure GAs are installed on the guest**

You can write shell function to simplify the call:

```bash
function vbox-get-ip() {
    if [ -z $1 ]; then
       echo "pass VM name"
       return
    fi
    vboxmanage guestcontrol $1 run --exe '/sbin/ifconfig' --username <username> --password <pass>
}
```
<br/>
Now just call `vbox-get-ip <vm name>` and `ifconfig` output will be shown!
<br/>

Sure you can execute other commands on the host. Just make sure you pass full path to the binary.
