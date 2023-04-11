---
title: "Git Commit Inspection"
date: 2023-04-11T10:36:59+02:00
categories: [git]
draft: false
---

In order to see a changes done in a given commit, we can see them with `git show <commit_hash>`

First lets check the history of commits:

```
$ git log -n 5

commit 1cb63f22c4b8d94457a0634531bf94a4662116c3 (HEAD -> main)
Author: rjonczy <robert.jonczy@gmail.com>
Date:   Tue Apr 11 10:37:23 2023 +0200

    updated Makefile

commit 81b1ec8c2e83d801512989248f6c661c34de4b6a (origin/main, origin/HEAD)
Author: rjonczy <robert.jonczy@gmail.com>
Date:   Fri Apr 7 23:16:46 2023 +0200

    chore: added draft post about .gitignore

commit afb982795d903c970c628f6ac7bcafc08fa53f79
Author: rjonczy <robert.jonczy@gmail.com>
Date:   Sat Apr 1 22:56:39 2023 +0200

    changed domain

commit 8edcc817b777939c24c33a8359a8cf82a3462265
Author: Robert Jonczy <robert.jonczy@gmail.com>
Date:   Thu Mar 30 18:49:32 2023 +0200

    use correct tag

commit 4458f462d55da75cd293a4c3a89b3e68e6d6c90c
Author: Robert Jonczy <robert.jonczy@gmail.com>
Date:   Thu Mar 30 18:30:19 2023 +0200

    rename
(END)

```

and lets pick up some commit hash to inspect, i.e. `afb982795d903c970c628f6ac7bcafc08fa53f79`

```
$ git show afb982795d903c970c628f6ac7bcafc08fa53f79

commit afb982795d903c970c628f6ac7bcafc08fa53f79
Author: rjonczy <robert.jonczy@gmail.com>
Date:   Sat Apr 1 22:56:39 2023 +0200

    changed domain

diff --git a/config.toml b/config.toml
index ba9706e..0af8912 100644
--- a/config.toml
+++ b/config.toml
@@ -1,4 +1,4 @@
-baseURL = 'https://til.jonczy.pl/'
+baseURL = 'https://til.jonczy.dev/'
 languageCode = 'en-us'
 title = 'Today I Learned'
 
@@ -17,7 +17,7 @@ theme = "hugo-theme-yinyang"
 
 [author]
   name = "Robert Jonczy"
-  homepage = "https://til.jonczy.pl/"
+  homepage = "https://til.jonczy.dev/"
```

With `git show ...` we can see which files were changed and what changes were done.

Something very similar we can get with:
```
git diff <COMMIT_HASH>~ <COMMIT_HASH>
```
which will show us a difference between <COMMIT_HASH> and ancestor of <COMMIT_HASH>.

```
$ git diff afb982795d903c970c628f6ac7bcafc08fa53f79~ afb982795d903c970c628f6ac7bcafc08fa53f79

diff --git a/config.toml b/config.toml
index ba9706e..0af8912 100644
--- a/config.toml
+++ b/config.toml
@@ -1,4 +1,4 @@
-baseURL = 'https://til.jonczy.pl/'
+baseURL = 'https://til.jonczy.dev/'
 languageCode = 'en-us'
 title = 'Today I Learned'
 
@@ -17,7 +17,7 @@ theme = "hugo-theme-yinyang"
 
 [author]
   name = "Robert Jonczy"
-  homepage = "https://til.jonczy.pl/"
+  homepage = "https://til.jonczy.dev/"
```


