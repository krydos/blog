---
layout: post
title: PHPNotifier - task scheduler
---
Hi,
Couple of days ago, working on my full-time project, I noticed we have a huge crontab file.
We have a lot of different scripts that checks status of different records in our database or status of users or status of emails that we sent or, or, or…

A lot of our classes have different flags (“checked”, “sent”, “approved”, etc…) and its something that really hard to manage.

Crontab is very useful tool but incase you use for things it was developed.

So, we were needed a task scheduler. Since we use PHP in our project it would be great to have it as packagist package but… I didn’t find anything that fit our needs.

So, today I finished my work on such library and I hope it will be useful not only for me and our team.

Meet [PHPNotifier already](https://github.com/KryDos/PHPNotifier) published in packagist.
This library allows you to schedule a task to the exact time or after some time.


```php?start_inline=1

use \PHPNotifier\PHPNotifier;
$scheduler = new PHPNotifier(PHPNotifier::FILE_METHOD, '/absolute/path/to/db.file');

$scheduler->scheduleTaskIn(10, 'echo', [ #execute "echo" command
	'Hello world!' # with "Hello world!" argument
	'>' # and redirect output
	'any_file' # to any_file
]);
```

<br/>

This code will schedule task that will be running in 10 seconds. And its awesome. Now, in our project, we have internal API calls (HTTP), that are triggering different tasks. PHPNotifier is sending curl requests to the API and it works great.

Checkout [GitHub page](https://github.com/KryDos/PHPNotifier) of this library. You can find more documentation there. It would be great if you can suggest how to improve it or even send a pull request.
