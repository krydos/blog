---
layout: post
title: Disable CURL's globbing parser
comments: true
description: curl, disable brackets parser.
---

Hey. Recently I've tried to CURL something like this:

`curl 'http://localhost?q[param]=value'`

and I got `[globbing] bad range in column` error from CURL.
This one is unexpected since I was thinking that using single quotes
do not require any escaping. To find a workaround you can check `man curl` and
seek for `globbing`.

So the solution is `-g` option:

`curl -g 'http://localhost?q[param]=value'`


P.S.

Sure you can manually escape square brackets but if your url is pretty long
it can take some time.
