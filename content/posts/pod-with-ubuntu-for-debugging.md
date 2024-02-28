---
title: "Pod with Ubuntu used for debugging"
date: 2023-11-23T16:28:48+01:00
draft: false
categories: [k8s]
---

Today I Learned: usefull pod with ubuntu for debugging on k8s


```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
spec:
  containers:
  - name: ubuntu
    image: ubuntu:latest
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 30; done;" ]

```

Another example, includes additionally:
- `imagePullSecrets`
- injects env from `Configmap` and `Secret`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu
spec:
  containers:
  - name: ubuntu
    image: ubuntu:latest
    command: [ "/bin/bash", "-c", "--" ]
    args: [ "while true; do sleep 30; done;" ]
    envFrom:
    - configMapRef:
        name: autocompounder
    - secretRef:
        name: autocompounder
  imagePullSecrets:
  - name: registryghcr
```