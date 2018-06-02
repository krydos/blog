---
layout: post
title: Fix Windows 10 search
comments: true
description: Windows 10 search no results
---

The issue
---------
The Windows 10 search is not working. No results. Infinite loading.

Solution
---------

Reinstall Cotonou (even if you don't use it at all)

* open `powershell` (with win+r and type `powershell`)
* paste this:

```powershell
Get-AppXPackage -Name Microsoft.Windows.Cortana | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```

It should take couple of seconds.

There are other solutions related to folders permission and registry keys but non of them did help.
