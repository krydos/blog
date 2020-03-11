---
layout: post
title: Frontend Developer interview. Help for interviewers (1)
comments: true
description: Frontend Developer interview. Situations to discuss with candidate
---

The problem
-----------

I'm not a huge fan of questions on interviews similar to:

* do you know X
* did you use Y
* what is the difference between X and Y
* etc...

Live coding is not something I like as well due to some reasons.

What really helps me to understand how good candidate is, is to discuss some real situations with him/her.

Below is one hypothetical projects to discuss with a candidate.

Also check out the [Part 2 of this post]({% post_url 2018-07-16-frontend-interview-discuss-part-2 %})

The project
-------------------------------
Given a Single Page Application (SPA). The main purpose of the app is to store movies a user added for himself.
Some kind of bookmarks.

Features are:

* add new movie

  * add title
  * add description
* show list of movies a user have added (only his/her movies)
* API has all required routes to store/fetch movies of a user

<br/>

**The problem** is our users have no stable internet connection for some reason.

**The question** how we can allow users to save movies even if the internet connection is lost?

Possible flow:

* Candidate usually starts with the idea to use Local Storage for storing all the data while internet is off.
  Which is definitely make sense. Here you can ask how he/she is going to integrate it:

  * Should it be separated module/class? (**definitely yes**)
  * Should developer use that module/class when internet is off and use calls to a server when internet is on?
    (**the answer can be very varied, but it should be some kind of
    general class that internally detects internet activity so the user of module (developer) should not think about
    current state of internet connection and use different modules/classes for saving/fetching movies**)
  * Probably there should be some kind of queue to make sure movies are sent to remote API in the same order they were
    added.

* When (if) you have discussed with a candidate all that above's points and he/she did great you can
  complicate the task a bit and say "Now we want to extend our **add new movie** page with an image of movie".

  * Here you should pay attention to the way a candidate thinks. He/She probably should come up with the idea
  that using Local Storage will not be enough if we're going to store images. Remember that we cannot use links
  since we're possibly offline.

  * Basically there are not too many possible options. [IndexedDB](https://developer.mozilla.org/ru/docs/IndexedDB) is
  something we can try to use in this case.


Don't hesitate to ask other questions you're interesting in. It's also OK if candidate don't know the answer,
sometimes we don't have answers too. We usually google in this case, but a candidate can't so it's completely OK
to give some help to him or her.

If you'd like to get more understanding on what knowledge the frontend candidate should have please refer to [How to Hire a Front-end Developer](https://www.toptal.com/front-end/how-to-hire) by TopTal.

Take a look at another project you can discuss with an applicant [here]({% post_url 2018-07-16-frontend-interview-discuss-part-2 %}).
