---
layout: post
title: Traceroute implementation
comments: true
description: Traceroute implementation in PHP
---
<a target="_blank" href="/assets/img/fun1.jpg"><img alt="fun first" src="/assets/img/fun1.jpg" width="550px"/></a>

Hi,
I’m sure you heard about traceroute command line tool. For me, it was pretty interesting to get to know about how it works and it would be great to implement basic functionality of it.
Hope it will be interesting for you also.

How does it work?
======================
Each TCP/IP packet has different information about itself.
One part of it is called **Time To Leave – TTL**. This information is needed for nodes (routers, computers) and it allows to understand when packet has to be dropped from a network.
TTL is not for fun there. It protects network from packets loop. Due to its value we have no packets that travels through the network infinitely.

The structure of IP header:

<a target="_blank" href="/assets/img/ip-header.gif"><img alt="ip header" src="/assets/img/ip-header.gif" width="550px"/></a>

TTL value is just a number. Each time when packet goes through a router the value decreases. TTL value is set by operation system and usually it has bigger number than needed to get the destination.
For example, You have TTL value – 3.
When your packet sends to the another computer it goes through many different nodes.

* your computer (ttl – 3) -> decrement ttl -> send to the next node
* router (ttl – 2) -> decrement ttl -> send to the next node
* nanother computer (ttl – 1) -> decrement ttl -> check if 0 -> destroy
* destination -> so sad, didn’t receive anything

When TTL is equal to 0 the receiver of this packet has to destroy it and send notification to the original sender via ICMP protocol.
Since Internet Protocol packets have information about sender and receiver, your machine will be notified that TTL is exhausted and you will know who sent it back to you.
Once again. TTL is set by operation system and it can be changed from OS to OS.

Ok, nice. What’s next?
=============================
If value of TTL can be changed by operation system then probably we should have ability to set it by ourselves.
In case it’s possible, we can set it to 1 and send a packet to any remote server. It will not get the destination server and will be destroyed by next machine in the network (it will be your router probably). When packet is destroyed you will get notification via ICMP.
In case you set it to 2 then packet will be destroyed by next machine behind your router.
So, we can increase TTL until we don’t get notification that package is destroyed by destination IP.

Code code code
==================
I want to bring some exotic so… lets use PHP (oh my god!).
<a target="_blank" href="/assets/img/fun2.jpg"><img alt="fun cat" src="/assets/img/fun2.jpg" width="350px"/></a>

I don’t want to show all the code here. You will find it in my GitHub repo. But I will try to explain basics.
First of all let’s create our TTL variable.

```php?start_inline=1
$ttl = 1;
```
<br/>
Now let’s create two sockets.

```php?start_inline=1
$icmp_socket = socket_create(AF_INET, SOCK_RAW, getprotobyname('icmp'));
$udp_socket = socket_create(AF_INET, SOCK_DGRAM, getprotobyname('udp'));
```
<br/>
UDP socket will  be used to send packet. Receiver will answer us via ICMP protocol and we will use this socket for reading.

Now the hard line…

```php?start_inline=1
socket_set_option($udp_socket, 0, IP_TTL, $ttl);
```
<br/>
**IP_TTL** constant doesn’t exist in PHP. Unfortunately value of IP_TTL constant is various on different operation systems.
On BSD like systems the value is 4. Linux has 2.
Also I was lucky that **socket_set_option** calls native kernel function internally so we can set third parameter of socket_set_option to any value.

Ok. Now let’s send a packet to Google :)

```php?start_inline=1
socket_sendto($udp_socket, '', 0, 0,'173.194.32.133' 33434);
```
<br/>
Good, lets wait for ICMP request from our router (remember we have TTL = 1)

```php?start_inline=1
$r = [$icmp_socket];
$w = $e = [];
socket_select($r, $w, $e, 5, 0); # 5 — timeout in seconds
if (count($r)) {
   socket_recvfrom($icmp_socket, $buf, 512, 0, $recv_addr, $recv_port);
   echo $recv_addr . "\n";
}
```
<br/>
Now we have address of our router (**$resv_addr** variable).
<br/>
Next, lets just wrap everything with loop where TTL will be increased with each iteration and we will get new remote machine’s IP one by one until doesn’t get Google’s IP.

```php?start_inline=1
while ($ttl < 128) { # 128 — default TTL value for Windows.
  // our previous code
  socket_close($icmp_socket);
  socket_close($udp_socket);

  $ttl++;
  if ($recv_addr == $dest_addr) break;
}
```
<br/>
And it looks like that:

<a target="_blank" href="/assets/img/trace-output.png"><img alt="trace output" src="/assets/img/trace-output.png" width="550px"/></a>
<br/>
A lot of information for this article I got from [Joshua Thijssen](https://adayinthelifeof.nl/about-me/) blog.
