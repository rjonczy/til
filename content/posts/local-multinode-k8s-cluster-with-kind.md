---
title: "Local Multinode K8s Cluster With Kind"
date: 2024-03-08T12:25:05+01:00
categories: ["k8s"]
draft: false
---

Get kind (or check for another [installation](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) methods)
```bash
# brew install kind
```



and create local k8s cluster with 1 node for control-plane and 3 worker nodes.
```bash
cat > kind-config.yaml <<EOF
# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
- role: worker
EOF
```

and voila:
```bash
❯ k get nodes
NAME                      STATUS   ROLES           AGE   VERSION
k8s-local-control-plane   Ready    control-plane   3h    v1.29.2
k8s-local-worker          Ready    <none>          3h    v1.29.2
k8s-local-worker2         Ready    <none>          3h    v1.29.2
k8s-local-worker3         Ready    <none>          3h    v1.29.2
```


Links:
- https://kind.sigs.k8s.io/
