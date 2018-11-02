---
layout: post
title: Ebay API and Platform Notifications
comments: true
description: Ebay Notifications are not sending by Ebay if you're using oAuth
---

If your web site isn't receiving the notifications from Ebay even though you have everything configured AND **you're using oAuth tokens** for `SetNotificationsPreferences` request then you have nothing to do except contact the Ebay support. 

Currently they have a special **whitelist** where they have to add your `APP ID` and the only way to add your app to that **whitelist** is to contact them. 
You can actually try to post a thread on their forum, but in this case you have to wait while someone form ebay staff will notice it.

Unfortunately the Support costs money and the price is $75/hour. Good news is they are not billing you for the request to whitelist your app so you can spend that hour for something else. 
