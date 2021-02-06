---
layout: post
title: "Laravel: get all routes and corresponding controllers/actions"
description: Get corresponding actions for routes
---

If you want to know the handler of a particular route you need to run this in your terminal:

```
php artisan route:list | grep 'route.name'
```

Replace `route.name` with your route name.

In most cases all routes are defined in files from `routes/*` folder but some routes are defined in Laravel itself or some libraries may define its own routes as well.
So in case you want to override some actions from internal controllers just use that command above to understand what exactly you need to override.



