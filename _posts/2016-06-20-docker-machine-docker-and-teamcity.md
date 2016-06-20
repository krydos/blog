---
layout: post
title: Setup TeamCity on Mac to work with Docker
comments: true
---
For one of our project we decided to use TeamCity on our Mac Mini (which is under table in the same room where we are).

It was interesting experience with some pitfalls and I would like to share how we did it.
Want to mention that installation of TeamCity is not subject of this article and I’m sure you can find a lot of posts about it in the internet.

One more important thing. TeamCity on our MacMini was installed to **/Library/TeamCity** folder. 
Docker machine shares only home directory (/Users) but some of our docker containers requires **/Library/TeamCity/hash/our project name/src** directory to be shared.


<h1>How does our project directory structure look</h1>
<br/>

Project structure

```
├── docker
│   ├── application
├── scripts
└── src
    ├── app
    ├── bootstrap
    ├── config
    ├── database
    ├── public
    ├── resources
    ├── storage
    ├── tests
    └── vendor
```

<br/>
Our `docker-compose.yml` looks similarly to this:


```
application:
    build: ./application
    volumes:
        - ../src:/var/www/application
```
<br/>

So, because our TeamCity loads the project inside **/Library/TeamCity** folder which is not shared between host and docker-machine we have the issue. From docker container's standpoint the folder looks empty.

<h1>What to do.</h1>
<br/>

* Open VirtualBox Manager.
* Choose your docker-machine (default - in my case)
* Press Settings.
* Go to Shared Folders tab and press Add new shared folder (folder with + icon at the right hand side)

<a target="_blank" href="/assets/img/vbox_manager_gui.png"><img alt="vbox manager gui" src="/assets/img/vbox_manager_gui.png" width="600px"/></a>

Add **Library** folder to the folders list.

That’s not enough. All these steps are only shares the folder to the VM but it is not mounted yet.

Login inside docker-machine via ssh (**docker-machine ssh**) and mount /Library folder like that:

```
mkdir /Library && mount -t vboxsf Library /Library
```

<br/>
And…. DONE!
Congratulations! Oh yeah, after docker-machine restart everything will gone…
<a target="_blank" href="/assets/img/thanks_satan.gif"><img alt="thanks satan" src="/assets/img/thanks_satan.gif" width="600px"/></a>


Since docker-machine is heir of boot2docker we can use special boot2docker feature that allow us to run the script right after machine is started.

- Login inside of docker-machine (docker-machine ssh)
- go to - /var/lib/boot2docker/
- create bootlocal.sh file
- open it and enter the next few lines

```bash
#!/bin/sh

mkdir /Library
mount -t vboxsf Library /Library
```

<br/>
That’s it. Now you can stop/start your docker-machine and after it will be started it execute bootlocal.sh file and this file will create /Library folder and mount host’s /Library folder to the guest /Library one.
