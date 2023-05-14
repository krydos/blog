---
layout: post
title: VirtualBox Headless mode
description: VirtualBox run machine in headless mode
tags: virtualbox
---

I use VirtualBox and do some testing and learning with multiple machines running at once.

Usually those machines are servers so I don't really need the GUI since I connecting to them using SSH clinet.

When VirtualBox is installed you'll see `VBoxManage` executable (`vboxmanage` is also there as alias) which is CLI tool
that allows you to interact with your VMs.

Here is a command how you can start VM in headless mode:

```bash
vboxmanage startvm <vm name> --type headless
```
<br/>
Pretty simple.

To shutdown the VM run this:

```bash
vboxmanage controlvm <vm name> poweroff
```
<br/>
That's it. You can also run `vboxmanage` without any params to get list of all options/actions it supports.

Have fun.
