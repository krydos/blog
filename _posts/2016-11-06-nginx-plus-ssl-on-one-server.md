---
layout: post
title: one Nginx, multiple sites, one SSL certificate
description: NGINX and multiple sites on one SSL certificate
---

Hey. Imagine you have 2-3 sites where you have to setup HTTPS but you are limited to use only one SSL certificate for this.

Today we'll find out how to do this.

I'm not going to describe how to get SSL certificate, just notice that our proxy-nginx will be configured on special domain and you have to get certificate exactly for this domain.

Nginx configuration.
===================

Add `server` block inside `http` block of your `nginx.conf` (or in one of included files).

```
server {
   listen 80;
   server_name the-proxy.domain;
   return 301 https://$server_name$request_uri;
}
```

This block just going to redirect all your HTTP connections 	 to the HTTPS on the same domain.

The next `server` block is actually our SSL configuration.

```
server {
   listen 443 ssl;
   server_name the-proxy.domain;
   ssl_certificate /etc/ssl/nginx/nginx.crt;
   ssl_certificate_key /etc/ssl/nginx/server.key;
   ssl_session_cache shared:SSL:10m;
   ssl_session_timeout 5m;
   ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !EXPORT !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS";
   ssl_prefer_server_ciphers on;
   ssl_password_file /etc/keys/cert_pass;
   ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

   location / {
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto https;

            proxy_pass http://127.0.0.1:8082;
        }
```

Make sure paths to SSL keys are correct.
One more important thing is `proxy_pass` statement.  I will describe it soon.

Ok. So now all connections to our domain (the-proxy.domain) are redirected to the HTTPS version and then are proxied to http://127.0.0.1:8082.

**What do we have on 127.0.0.1:8082?**

On this port we have our application running.
We may have other application running on other ports and we can describe them in our `server` blocks.
So, make sure your application is actually running on this port and nginx will proxy all the traffic.

Unfortunately you app is also available by 8082 port which is not great. You can close it with firewall and allow connections from the same server where app is running (and where our proxy-nginx is installed).

That's it. You can add as more `server` blocks as you want and proxy traffic to other servers/ports you wish.

P.S.
This one is pretty old article. Consider to use <a target="_blank" href="https://letsencrypt.org/">Let's Encrypt</a> instead.

**<3**
