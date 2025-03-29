---
date: "2018-06-09T00:00:00Z"
description: Manage state of VMWare VMs from command line
tags: vmware
title: VMWare run/stop VM from command line
---

Hi everyone,

so here are two basic commands you can wrap in functions or anything else to run/stop VM of **VMWare Workstation**.

**Important note**, all commands are for Windows. They should work for other systems I guess with minimal or no changes.

<h2>To start a VM use this command</h2>

```bash
vmrun -T ws start "C:\vms\workstation.vmx" nogui
```

`nogui` option in this case forces the vmrun NOT to open the GUI window.
`workstation.vmx` is a file, usually is the same as your VM name.

<h2>To stop a VM</h2>

There is nothing special. Just stop instead of start.

```bash
vmrun -T ws stop "C:\vms\workstation.vmx"
```

You can check out the output of `vmrun` command to see a bit more options to manage VMs.

Also take a look at my [other]({{% ref run-commands-on-guest-vm %}}), [posts]({{% ref virtualbox-headless-mode  %}}) related to pretty the same subject but for VirtualBox.
