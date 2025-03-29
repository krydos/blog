---
date: "2023-12-12T00:00:00Z"
description: null
tags: php
title: sandbox.smtp.mailtrap.io port 25 isn't available anymore
---

I can't connect to port 25 anymore.
I noticed it in a Laravel application but the issue exists for everyone.

```bash
nc -vvv sandbox.smtp.mailtrap.io 25
```

just doesn't connect.

It's been an issue for a few weeks now.

To fix it just change the port 25 to 2525 (this one doesn't require TLS).
