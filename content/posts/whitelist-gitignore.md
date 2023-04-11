---
title: "Whitelist for .gitignore"
date: 2023-04-07T22:40:00+02:00
draft: false 
categories: [git]
---

Sometimes in git-repo we want to opt-in for some particular files/directories, rather 
than blacklisting, what we do not want. Than we need someting lile a whitelist in `.gitignore`,
so we can specifically opt-in what will be added to repo.

One of such cases, what I have recently found are [.dotfiles](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments).
I wanted to keep track of some of them (like `.config/nvim/*`, `.config/sway/*`), but not all of the files in `.config` dir.

Whitelist in `.gitignore`, we can achieve in a following way

`.gitignore` file
```
*
!*/

# whitelist this file
!.gitignore

# whitelist everything in ./nvim/
!nvim/**
```

This will allow us to blacklist everything in a folder, but we can specifically define what we want to track.

