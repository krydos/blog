---
layout: post
title: notify-send replacement for WSL
description: notify-send in wsl with help of powershell
---

Hi,

Unfortunately there is no way currently to make brilliant `notify-send` work on WSL.

Solution
--------
The workaround is to install [BurntToast](https://github.com/Windos/BurntToast) which is
`powershell` module (or command) that allows you to show native notifications.
After it's installed we can write a script that can execute PowerShell "cmdlet" from within WSL.

Details
-------

So when **BurntToast** is installed let's create a super simple bash script (name it like `wsl-notify`)

```bash
#!/usr/bin/env -bash

powershell.exe "New-BurntToastNotification -Text \"$1\""
```

Give our `wsl-notify` execution rights (with `chmod +x wsl-notify`) and move it to `/usr/bin` folder with `mv wsl-notify /usr/bin/`

That's it, now we can call `wsl-notify 'The Notification Text'` and we will get native notification in Windows.
Make sure to wrap all the text into single or double quotes to make all the text to be considered as a first argument to our `wsl-notify` script.

Troubleshooting
---------------

When **BurntToast**  is installed you have to make sure it works, just fire up your PowerShell and type `New-BurntToastNotification`.

If you see error saying something about import module, then you have to import the module.
Just type `Import-Module BurntToast`.

In case you've got error during the import process,
it's probably because third-party scripts execution is not allowed on your system
which can be fix with this command:

`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` - (checkout more about it [here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-6))
