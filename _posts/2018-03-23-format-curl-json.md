---
layout: post
title: CURL get formatted JSON
description: Format JSON with CURL and jq
tags: curl
---

Hey,

Sometimes I check HTTP responses with CURL so it would be great to format JSON responses.

There is cool <a target="_blank" href="https://stedolan.github.io/jq/">command line JSON parser</a> and you can pipe CURL output to it like that:

`curl http://some.endpoint/with-json-response | jq '.'`

I've wrote useful function called `jcurl` that is basically wrapper on that command above:

```
function jcurl() {
    curl "$@" | jq '.'
}
```
<br/>

P.S.
Don't forget to source your `(bash|zsh|any)rc`.
