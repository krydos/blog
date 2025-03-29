---
date: "2018-03-23T00:00:00Z"
description: Format JSON with CURL and jq
tags: curl
title: CURL get formatted JSON
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
