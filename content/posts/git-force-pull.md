---
title: "Git Force Pull"
date: 2023-04-18T14:07:12+02:00
categories: ["git"]
draft: false
---

Today I Learned: in order to overwrite local changes with remote from `origin`, you can do:

1. update all `origin/<branch>` refs to latest
```
git fetch --all
```

2. backup branch
```
git branch backup-main
```

3. jump to latest commit on `origin/main` and checkout those files
```
git reset --hard origin/main
```


Link to [SO](https://stackoverflow.com/questions/1125968/how-do-i-force-git-pull-to-overwrite-local-files)

