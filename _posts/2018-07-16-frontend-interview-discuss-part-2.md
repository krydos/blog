---
layout: post
title: Frontend Developer interview. Help for interviewers (2)
description: Frontend Developer interview. Situations to discuss with candidate part two
---

If you didn't look at [Part 1]({% post_url 2018-07-16-frontend-interview-discuss %}) of this post please check it out.

Project 2
----------

Given a news site and its admin area. In admin area there are many users. Each user can edit a news-post.

**Our goal** is to make sure only one user can edit a post even if multiple users are visited the same news-post for editing. Users visited a news-post after the first user should see the "someone else is editing the post" message.

**More info about the project:**

* It's not a single page application
* Backend part of the code already able to lock/unlock the post internally (we just need to call the function).
* Backend developer can implement endpoints/services a candidate ask.

Possible flow:
-------------

* Candidate usually come up with the idea to use Web Sockets. If so, you can ask candidate about how it should work.


  * What message(s) should be send by web socket client to a server?
  * What answer should be send by web socket server so client can know that post is blocked?
  * How to make sure two users will not block the post?
  * When user leaves a post who should be the next "owner" of a post if multiple other users are on a post page?

* When you have discussed all that possible implementations for web socket you can tell candidate that
  "**unfortunately we don't have ability to setup web socket server on
  our production and have to come up with something else**".
* Something else is **long polling** technique which is basically periodic Ajax requests to a server.


  * Frontend can have two Ajax requests sending by interval (one is to lock, another one is to check if locked)
  * Backend should receive the "lock" and lock the post **TEMPORARY**.
  * If no another "lock" request received by the same user we should unlock the post (temp record should be removed)
  * Lock the post when there is no "lock" on the post and mark that post is locked by a user.

I hope this project and the project from Part 1 will help you to understand more about your candidate.
