---
date: "2018-12-21T00:00:00Z"
description: Turn off warnings in react native
tags: react
title: React Native. Turn off warnings
---

Sometimes it's annoying to get those warnings while you work on the layout stuff.

Based on [RN documentation](https://facebook.github.io/react-native/docs/debugging.html#warnings) you can turn them off by setting:

```javascript
console.disableYellowBox = true;
```

You can put it inside your App.js file. I don't suggest you to commit this but as temporary string is definitely acceptable.
