---
layout: post
title: Restclient (Postman for Emacs)
comments: true
---

Hi everyone.

Here is my notes about `restclient` that can help you to forget about `Postman` (which is cool as well).

Define the action
-----------------
Here is the example:

```bash
#
# get all people from star wars
#
GET https://swapi.co/api/people
```
<br/>
<br/>

To define an action you need to start with a comment.
<img src="/assets/img/hm.webp"/>

Then you need to set method (GET, POST, PUT and other) and the url of course.

Now you can execute the query. Press `C-c C-c` (CTRL+c twice) and new buffer (`*HTTP Response*`) with the result will be opened.

<a target="_blank" href="/assets/img/restclient-output1.png"><img alt="restclient output" src="/assets/img/restclient-output1.png" width="550px"/></a>

At the bottom of that buffer you can see response headers:

```bash
// GET https://swapi.co/api/people
// HTTP/1.1 200 OK
// Date: Sun, 22 Oct 2017 19:03:17 GMT
// Content-Type: application/json
// Transfer-Encoding: chunked
// Connection: keep-alive
// Allow: GET, HEAD, OPTIONS
// Vary: Accept, Cookie
// X-Frame-Options: SAMEORIGIN
// Etag: "d080408a4d656729b0f52a6feb0783ca"
// Via: 1.1 vegur
// Server: cloudflare-nginx
// CF-RAY: 3b1eb73cda7d63af-FRA
// Request duration: 1.663359s

```
<br/>

Pretty simple, ha?

Set headers
-----------
To define header(s) you need to write it right above the URL definition:

```bash
#
# get all people from star wars
#
GET https://swapi.co/api/people
User-Agent: Emacs Restclient
Content-Type: application/json
```
<br/>
By pressing `C-c C-c` the headers will be attached to the request.

Post payload
------------

If you want to send data to the server you can define it right after empty line of the action definition.

Here is an example from `restclient.el` repo.

```bash
#
# Post works too, entity just goes after an empty line. Same is for PUT.
#
POST https://jira.atlassian.com/rest/api/2/search
Content-Type: application/json

{
        "jql": "project = HSP",
        "startAt": 0,
        "maxResults": 15,
        "fields": [
                "summary",
                "status",
                "assignee"
        ]
}
```
<br/>

What if I want to post a file?
------------------------------

It's also possible and it's pretty easy


```bash
#
# post a file
#
POST http://httpbin.org/post
Content-Type: text/plain

< /etc/hosts
```
<br/>

You can even define variables
-----------------------------

Variables are useful to define the host or test user credentials.

Here how you can define it.

```bash
:myvar = https://google.com
```
<br/>

You can also use elisp to set a value

```bash
:myvar := (some (artbitrary 'elisp)
```
<br/>

use `:variable-name` syntax to get the value of variable:

```bash
#
# use a variable
#
GET :myvar/imghp
```

<br/>

<a target="_blank" href="https://github.com/pashky/restclient.el">Restclient.el</a> is a great package you definitely should try.
I usually have it in my API repo if it's personal project or have it in local gitignore when work in a team.
It allows you to quickly explore or test the API without leaving the Emacs.

<img src="/assets/img/thumb-up.gif"/>

Try it <3
