+++
date = '2026-02-02T21:25:49+11:00'
draft = false
title = 'Some networking tips'
+++

I think I don't understand computer networking really well so I've been playing with some related tech to improve my knowledge.

Here are the interesting stuff I found.

## Broadcast address

Sending UDP packets to 192.168.1.255 will make this UDP packet seen by every machine in my network. At least computers that are in 192.168.1.0/24 (which means a range from 192.168.1.0-192.168.1.254).

This type of IP is mentioned in [RFC 6890](https://datatracker.ietf.org/doc/html/rfc6890) so the standard defines how it works.
It's not just my router magically configures it. It's a common behaviour.

## Ping cannot be send to broadcast address

If I try to do **ping 192.168.1.255** I get an error saying **Do you want to ping broadcast? Then -b. If not, check your local firewall rules**.<br>
Option **-b** works.<br>
It's implemented in ping binary [over here](https://github.com/iputils/iputils/blob/master/ping/ping.c#L894C10-L894C89).

The reason is that it looks like Linux kernel itself do not allow to send packets to broadcast address unless socket is opened with **SO_BROADCAST**.
It's all there probably due to some security related reasons to protect network flooding.

### Question I was unable to answer
If I send TCP SYN packet to 192.168.1.255 will I get ACK back from all the computers in my network? ([tcp handshake](https://developer.mozilla.org/en-US/docs/Glossary/TCP_handshake))

## Multicast addresses

This thing is defined in [RFC 1112](https://www.rfc-editor.org/rfc/rfc1112.txt).

Sort of similar to Broadcast address but other machine must subscribe to a broadcast first by sending a message (using special protocol) to a particular IP from the range defined in the RFC.<br>
The range is pretty big - **224.0.0.0 to 239.255.255.255**. <br>
268 million IPv4 addresses could be freed up if this cool Multicast range didn't exist.

## mDNS

It's like DNS but doesn't require an actual DNS server. I think it's supported pretty much on every modern OS now. <br>
It uses special domain **.local** and if you try to **ping test-machine.local** mDNS will ignore sending **test-machine.local** to the DNS server.
Instead it will use multicast thingy I mentioned above to send a message to IP **224.0.0.251** with a host name **test-machine.local** and the machine that has this domain name and has mDNS configured, will reply back with its IP address.
Because machines that support mDNS subscribe to the broadcast for all the packets sent to **224.0.0.251**.<br>
Pretty neat.<br>

## Bash /dev/{udp,tcp}/\<ip\>/\<port\>

**echo "test" > /dev/tcp/192.168.1.111/8080** - this command will send **test** to IP **192.168.1.111** to the port **8080**.<br>
I saw it mentioned somewhere in the internet couple of times and I thought it's Linux kernel feature but I found it's actually Bash feature.<br>
/dev/udp or /dev/tcp are not even in the file system. Bash just intercepts these devices/paths and does the magic.<br>
[Check this man page](https://man7.org/linux/man-pages/man1/bash.1.html) (search for "/dev/tcp")


It is quite refreshing to understand these bits.
