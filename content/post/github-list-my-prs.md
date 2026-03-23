+++
date = '2026-03-23T21:01:32+11:00'
draft = true
title = 'List all my open PRs on GitHub'
+++

If you open github.com you'll see the copilot chat interface.

<a target="_blank" href="/assets/img/copilot.chat.png"><img width="600px" src="/assets/img/copilot.chat.png"/></a>

Apparently you can ask for assistance in there. For example, there is even a helper button for it, you can ask it to find all your open PRs.


<a target="_blank" href="/assets/img/copilot.chat.prs.png"><img width="600px" src="/assets/img/copilot.chat.prs.png"/></a>

If you click **My open pull requests** it will helpfully type the request to the copilot for you in the textarea.

<a target="_blank" href="/assets/img/copilot.chat.prs.query.png"><img width="600px" src="/assets/img/copilot.chat.prs.query.png"/></a>

Isn't it handy? AI is just so much better, I don't understand how some people don't get it.

Now I can prompt it once in a natural language, submit and get the results in a couple of seconds while copilot is thinking and burning tokens.

<a target="_blank" href="/assets/img/copilot.chat.reply.png"><img width="600px" src="/assets/img/copilot.chat.reply.png"/></a>

Oh oh. Well, a bit more than couple of seconds and one prompt.

---

Anyways, here is how you do it.

```
gh search prs --author @me --state open
```

<a target="_blank" href="/assets/img/github.prs.list.png"><img width="600px" src="/assets/img/github.prs.list.png"/></a>

it takes one second.
