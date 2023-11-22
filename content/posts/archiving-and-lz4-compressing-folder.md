---
title: "Archiving and lz4 compressing Folder"
date: 2023-11-22T11:16:12+01:00
draft: false
categories: ['linux']
---

Today I Learned: "Handy command to archive and lz4 compress folders"

Archive and compress

```
# tar cvf - parachain | lz4 > parachain.tar.lz4
```

and uncompress and unarchive
```
# lz4 -d parachain.tar.lz4 -c | tar xvf -
```



