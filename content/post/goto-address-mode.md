+++
date = '2026-04-05T14:12:53+10:00'
draft = false
title = 'Emacs: goto-address-mode'
tags = ['emacs']
+++

In [one of my previous blog posts]({{< relref "./github-list-my-prs.md" >}}) I mentioned a command that returns the list of all **open**
pull requests I have ever created on github:

```
gh search prs --author @me --state open --json title,url --template '{{range .}}{{.title}} - {{.url}}{{"\n"}}{{end}}'
```

<br>

I wrapped this command into **krydos/show-my-prs** elisp function that just executes the above's snippet using **async-shell-command**.

Here is its output:

<a target="_blank" href="/assets/img/showmyprs.png"><img width="600px" src="/assets/img/showmyprs.png"/></a>

Looks great and already useful for me but what's missing is clickable links.

Turns out Emacs, **as usual**, have a built in answer.

The mode is called **goto-address-mode**. Just turn it on in the buffer and all the links become clickable (you can also **C-c RET** on them).
<br>Look:

<a target="_blank" href="/assets/img/showmyprs-with-the-mode.png"><img width="600px" src="/assets/img/showmyprs-with-the-mode.png"/></a>

Emacs is the best!
