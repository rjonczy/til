---
title: "Kafka Upgrade With Strimzi"
date: 2024-10-13T18:25:24+02:00
draft: true
---

# Kafka upgrade (with strimzi operator)

## Overview

strinzi operator: 0.38 -> 0.43
kafka: 3.6 -> 3.8

## Prerequirities

First we need kafka cluster deployed using strimzi operator. I will use `kind` to create some temporary k8s cluster for need of this demonstration.

### Temporary cluster

Create new temporary multinode k8s cluster based on `kind`.

Create manifest of cluster:
```bash
cat > k8s-multinode-config.yaml <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
- role: worker
EOF
```

```bash
kind create cluster --name k8s-local-multinode --config k8s-multinode-config.yaml
```

... and create namespace for kafka cluster and strimzi operator itself
```bash
kubectl create namespace kafka
kubectl create namespace strimzi-operator
```

### Deploy strimzi operator (with version which you want to upgrade)

Add helm repo
```bash
helm repo add strimzi https://strimzi.io/charts/
helm repo update strimzi
helm search repo strimzi-kafka-operator --versions
```

### Generate manifests

```bash
helm template strimzi-operator \
  strimzi/strimzi-kafka-operator \
  --values values.yaml \
  --namespace strimzi-operator \
  --version 0.38.0 \
  --include-crds \
  > strimzi-operator-templates-0.38.yaml
```


Deploy kafka cluster with Zookeeper (3 brokers + 3 zookeepers)

## Upgrade procedure

```bash
helm template strimzi-operator \
  strimzi/strimzi-kafka-operator \
  --values values.yaml \
  --namespace strimzi-operator \
  --version 0.43.0 \
  --include-crds \
  > strimzi-operator-templates-0.43.yaml
```

## Downgrade procedure


## Clean

Remove kafka (+ zookeeper) cluster
```bash
kubectl -n kafka delete $(kubectl get strimzi -o name -n kafka)
```

Remove kind cluster
```
kind remove cluster
```

## Troubleshooting

Checking the Kafka status for errors
```bash
kubectl get kafka my-cluster -n kafka -o jsonpath='{.status.conditions}'
```

```
❯ kubectl get kafka my-cluster -n kafka -o jsonpath='{.status.conditions}' -w
[{"lastTransitionTime":"2024-10-11T09:47:40.251289386Z","message":"Unsupported Kafka.spec.kafka.version: 3.6.0. Supported versions are: [3.7.0, 3.7.1, 3.8.0]","reason":"UnsupportedKafkaVersionException","status":"True","type":"NotReady"}]
```

## Links