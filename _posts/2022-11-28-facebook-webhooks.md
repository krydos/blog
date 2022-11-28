---
layout: post
title: Facebook webhooks won't accept Ngrok and Localtunnel anymore
description: Fix for facebook webhooks using own domain and server
---

If you want to test webhooks locally you probably use Ngrok or Localtunnel. I do.

Recently I wanted to play with Instagram webhooks and I couldn't because surprisingly
Facebook do not accept Ngrok and Localtunnel URLs anymore and marks them as
`malicious and/or abusive`.

I don't really understand why Facebook blocked the only known solutions of local webhooks testing.

Fortunately I have a server and a domain name.

## Solution

What we'll need:

- Nginx
- LetsEncrypt cert (because Facebook wants HTTPS URL)

As soon as you configured your Nginx and it can accept traffic on port 443
add `location` section like this (**pay attention to all the slashes. They are important**):

```
location /proxy/ {
  proxy_pass http://localhost:3000/;
}
```

This will grab all the traffic to `you-domain/proxy/`, decrypt it and proxy it to port 3000.

Now, on you local machine, run:

```
ssh -R 3000:0.0.0.0:3000 -N user@server
```

Change ports as needed. The very first `3000` is remote port to redirect traffic from.
The `0.0.0.0:3000` part is your local server listening on port `3000` as well.

You local server will get URLs without that `/proxy` part.
So `your-domain/proxy/webhooks` will be transformed to `0.0.0.0:3000/webhooks`

Now the traffic goes like this:

`Origin(https) -> your-domain(https) -> your-server:3000(http) -> your-local-machine:3000(http)`
