---
title: "Vim Replace From Current"
date: 2023-09-21T10:28:08+02:00
categories: [vim, test]
---

Today I Learned: in order to replace in Vim from CURRENT line to end you do

Replace from CURRENT line to the end
```
:.,$s/BEFORE/AFTER/g
```
meaning:
- `.` - current line
- `$` - end of document

`.` can be removed and then, we have
```
:,$s/BEFORE/AFTER/g
```

I used to use a lot before:
```
:%s/BEFORE/AFTER/g
```

where: `%s` is short for `1,$` meaning the entire document.

For more help see
```
:h range
```
