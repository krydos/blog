---
layout: post
title: Run multiple PostgreSQL instances on one machine
description: Multiple PostgreSQL instances on Ubuntu 18.04
---

I'm on Ubuntu 18.04 having PostgreSQL 10.10 installed.
For testing I had to run PostgreSQL 9.5 along with 10.10.

Installation
====

If you don't know how to install version 9 on Ubuntu 18.04 check [this doc on postgres site](https://www.postgresql.org/download/linux/ubuntu/).

To install version 9.5 just run:

```
sudo apt install postgresql-9.5
```

That's it. You should not face any other issues.

Usage
====

I've been always starting postgres instance with `sudo service postgresql start` but now,
when we have two different version we should use:

```
sudo systemctl start postgresql@9.5-main
```

The `9.5-main` at the end is the cluster name. Cluster is something we always have per database version. You can find all the clusters you have on your machine with:

```
pg_lsclusters
```

The output looks like this:

```
Ver Cluster Port Status Owner    Data directory               Log file
9.5 main    5432 online   postgres /var/lib/postgresql/9.5/main /var/log/postgresql/postgresql-9.5-main.log
10  main    5432 down postgres /var/lib/postgresql/10/main  /var/log/postgresql/postgresql-10-main.log
```

You can see that right now I have 9.5 running and 10 down.

To run version 10 again just stop the 9.5 instance and run `sudo systemctl start postgresql@10-main`

If you want to run both instances simultaneously then you have to edit `postgresql.conf` of your version
(every version's config file is in its own directory under `/etc/postgresql`) and set another port to listen in one of your versions.
