---
layout: post
title: Emacs ledger-mode with hledger
description: Emacs, hledger binary and ledger-mode
tags: ledger emacs
---

[Hledger](https://hledger.org/) is a text based accounting tool.
It's very similar to [Ledger](https://www.ledger-cli.org/) (hence the name).

Emacs has great `ledger-mode` but if you use Hledger you'll definitely get some issues.

## TLDR
here is my `use-package` block where most of the issues are solved
```lisp
(use-package ledger-mode
  :straight t ;; or :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.\\(h?ledger\\|journal\\|j\\)$" . ledger-mode))
  (setq ledger-binary-path "path-to-fix-hledger-script.see-below")
  (setq ledger-mode-should-check-version nil)
  (setq ledger-report-links-in-register nil)
  (setq ledger-report-auto-width nil)
  (setq ledger-report-native-highlighting-arguments '("--color=always"))
  (setq ledger-highlight-xact-under-point nil)
  (setq ledger-default-date-format ledger-iso-date-format))
```

## Add new transactions issue. xact.
There an error appears when you try to add a new transaction that says `xact` isn't available.
`xact` is a tool that comes with ledger but it doesn't exists in hledger package.

The tool is basically trying to match records based on the query passed into it and then return the matched record. Kind of minimal autocompletion.

`hledger` has `--match` option instead and to make it work I suggest to refer to [this script](https://github.com/simonmichael/hledger/issues/367#issuecomment-956436493) provided by Anthony Carrico.

Make it executable, put in whatever place you want and update `ledger-binary-path` variable in your Emacs config.

That should make everything work.
