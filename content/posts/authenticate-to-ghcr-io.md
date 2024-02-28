---
title: "Authenticate to ghcr.io (Github Container Registry)"
date: 2024-02-28T11:59:04+01:00
draft: false
categories: ['github']
---


Today I Learned: authenticate to ghcr.io registry

In order to pull docker images from private repos you need to authenticate to docker registry first.

1. Create PAT (Github's Personal Access Token) - classic

Create classic token - https://github.com/settings/tokens

2. Export token

```bash
export CR_PAT=YOUR_TOKEN
```

3. Authenticate
```bash
$ echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
> Login Succeeded
```

Links:
- https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
