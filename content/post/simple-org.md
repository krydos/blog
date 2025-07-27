+++
date = '2025-07-27T16:35:19+10:00'
draft = false
title = 'Emacs: Keep journaling on the go'
tags = ['emacs']
+++

I've been journaling a lot for many years. It cools down my brain a little and helps me reflect on things better.
Emacs and org-mode are of course the tools I use to journal.

## The problem

I can't easily journal on the go when I only have my phone handy.

## Solution

I've built incredibly minimal web page with a simple form.
When the form is submitted it is captured by a script, parses the form data and calls my Emacs with `--eval` to
add the form data into my `journal.org` file.

And when I say minimal I mean it. Just look at it.
<img alt="simple-org screenshot" src="/assets/img/simple-org.png" width="100%"/>

Here is its whole source code:

```php
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=2.0, maximum-scale=4.0">
    </head>
    <body>
        <form action="" method="post">
            <input name="title" type="text"/><br/>
            <textarea name="content"></textarea><br/>
            <button>submit</button><br/>
        </form>
    </body>
</html>

<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = addslashes($_POST['title']);
    $content = addslashes($_POST['content']);

    # In actual file it's a oneliner.
    # I split it for this post purposes.
    # Hope it still works in case you decide to copy/paste.
    $cmd = "emacs --batch --load=\"~/.emacs.d/init.el\" --eval \"";
    $cmd .= "(progn ";
    $cmd .= "  (org-capture nil \\\"j\\\")";
    $cmd .= "  (insert \\\"{$title}\\\")";
    $cmd .= "  (end-of-buffer) (org-return) (org-cycle)";
    $cmd .= "  (insert \\\"{$content}\\\") (org-capture-finalize))\"";

    shell_exec($cmd);
}
?>

```

<br/>

I start it with `php -S 0.0.0.0:8080` and it just works. It knows what templates I use and it knows where the `org-directory` is. <br/>
I deployed it to my home server (just a laptop in my closet) and run it using [Portainer](https://www.portainer.io/).

My home server is constantly available for me thanks to [Tailscale](https://tailscale.com/) so I can access it outside of my home.

## Why not
### Why not Orgzly

[Orgzly](https://github.com/orgzly-revived/orgzly-android-revived), for those who doesn't know, is an Android app that
allows to interact with org-mode files. One can import org files in it and then just update them on the go.
Synchronization among machines can be done with [Syncthing](https://syncthing.net/).

It's very good app and I was using it for journaling a lot.
Often times though, I want to add a note to my journal and then I realize that I need to create
all the subheadings for today manually to follow the format I defined in my `org-capture-templates`. Not a big deal and it worked
for awhile but it stopped me from dumping my thoughts into the journal quite a few times.

### Why not Emacs on Android or Termux + Emacs

Both are great solutions as soon as one plugs in a keyboard into their phone. Using Emacs on a touch-screen is of course possible
but the amount of frustration I get in the first 10 seconds of using it feels very much unjustified.

### Why not run the same script on your phone locally

In this case I don't need the whole home server setup with tailscale and portainer. Just syncthing which I already have would do the job.<br/>
Good point. I just wanted to have a bit more fun than that :)
