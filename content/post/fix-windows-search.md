---
date: "2018-06-02T00:00:00Z"
description: Windows 10 search no results
tags: windows
title: Fix Windows 10 search
---

The issue
---------
The Windows 10 search is not working. No results. Infinite loading.

Solution
---------

Reinstall Cortana (even if you don't use it at all)

* open `powershell` (with win+r and type `powershell`)
* paste this:

```powershell
Get-AppXPackage -Name Microsoft.Windows.Cortana | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
```

It should take couple of seconds.

There are other solutions related to folders permission and registry keys but non of them did help.
