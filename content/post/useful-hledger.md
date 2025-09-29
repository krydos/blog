+++
date = '2025-09-30T08:08:16+10:00'
draft = false
title = 'Useful Hledger'
+++

I've been using [hledger](https://hledger.org/) since 2022. I started it as an experiment hoping to understand where my money goes, find some patterns in my spending
and save some money eventually. I did not identify many patterns, if any, but I still was able to save some money.

I'm going to describe how and why I find tracking money being useful and then I'll show you my setup.

## Why is it useful to track finances

It seems like, at least in my case, I was able to reduce money spend just by tracking where they go.
I blame my subconscious for this. For example I probably noticed that I spend too much on food delivery services and then I started to cook at home more often.

I don't remember any cases during almost 4 years when I found a spending pattern that was an obvious issue. Never happened. Some things happened though:

- I found some cases when I paid too much fees for a service I used regularly, which then led me to find a replacement for it.
- Found that I pay for telecommunications (internet, phone) too much considering my usage. It led me to close some internet accounts and change my phone package.
- I paid too much for the apartment I rented. I didn't need hledger to figure this out, but doing summary report one day, I noticed the money I spent on it in 6 months were uncomfortably large even though monthly payment was acceptable by me.
- I've noticed coffee prices went up :D

## How I track it

I use my phone and laptop with Emacs. Files are synced using [syncthing](https://syncthing.net/). The whole process is half automated.

On my phone I use Termux and [Termux:API](https://wiki.termux.com/wiki/Termux:API) package. It allows me to get list of all notifications that
I can then parse into hledger records.

[I have a script](https://gist.github.com/krydos/62a7c5de05a74606e2c56a3a6e321523) (call `ledger-check` to execute it) that parses all notifications and if a bank notifications found, saves them into the `ledger.journal` file (which is a hledger file for current year).
It runs every minute on my phone in Termux session so notifications aren't usually lost.

The script makes `sha256` hash from each record and adds it to the hledger file as well so next time the script is ran the records not duplicated.

Each record looks similar to this:

<pre>
;; automation:bf4e2493fc27a6d17bd173ea9c70620759766f29
;; datetime: 2025-09-25 17:32:42
;; content: Paid $20.65 at Place Name Here AUD Balance: $100.41
2025-09-25 eating out
    expenses:food:eat-out                      20.65 AUD
    assets:banks:bankname1
</pre>
<br/>

In this case the title and expense category were recognised automatically because I have this place mentioned in my templates list (see the script).
Otherwise it would mark it as `expenses:unknown` which means I then should go and manually update records on my laptop. This is why I keep `content:` to each
record which is full content of push notification received from a bank app. It helps me to deal with "unknown" records later.

**Every week on Sunday** I then review my spendings and check if amount of money in my bank account matches with what hledger report tells me.
I manually adjust my ledger records if there is a mismatch (using special expense category for this).

Thanks to Emacs and [ledger-mode](https://github.com/ledger/ledger-mode) I can just simply run `M-x ledger-report` and choose among many pre-existing reports.
I also made a few of my own.

## Final Thoughts

I've noticed that parsing bank notifications is easier than looking for ways to integrate with a bank or special bank reports that are often available for download.

Keeping all the records in simple text file has been very useful and makes me feel safe. I believe simple txt format will never go away.
If [hledger](https://hledger.org/) disappears I can easily replace it with [ledger](https://ledger-cli.org/) or [beancount](https://github.com/beancount/beancount).
Even with my own scripts if necessary.

I sometimes read that people use a tool for a week or a month and able to tell how useful it is.
I wish I have similar skill.
I think test driving this tool for 4 years proves its usefulness for me.
