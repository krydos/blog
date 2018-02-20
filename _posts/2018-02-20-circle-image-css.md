---
layout: post
title: Circle image with CSS
comments: true
description: How to make circle image with CSS
---

Here is not about how to make circled image with css. I have to note it since
I can't remember how css works in general and can't force myself to learn it.

Here is the result:

<a href="/assets/img/circled-images.png" target="_blank"><img width="600px" src="/assets/img/circled-images.png" /></a>

I was trying to use just `border-radius` but it's not super great since it doesn't allow
us to center the content of image.

Solution is class similar to this one:

```css
.img-circular {
    width: 50px;
    height: 50px;
    background-size: cover;
    display: inline-block;
    border-radius: 50px;
    background-position: center;
}
```
<br/>

Of course you also have to set `background-image: url(<the url>)` for your image.
I do it with `style` attribute directly. Here is how the element code looks like in general:

```html
<div style="background-image: url('url-here')" class="img-circular"></div>
```
<br/>
As you can see there is no `img` tag at all and we use div with background image instead. It allow us to center
the background.
