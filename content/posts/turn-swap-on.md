---
title: "Turn Swap On"
date: 2024-03-08T13:56:06+01:00
draft: false
categories: ['linux']
---

GCE instance by default are comming without swap on. It can cause sometimes, than vms are "freezing".

Below is how to manually add swap of size 16GB.

```
# fallocate -l 16GB /var/swap
# chmod 600 /var/swap
# mkswap /var/swap
Setting up swapspace version 1, size = 14.9 GiB (15999995904 bytes)
no label, UUID=d6e4ba3a-986d-468c-90a2-9bab1b5b5e72

# swapon /var/swap
```

Add to `/etc/fstab`

```
/var/swap none swap sw 0 0
```

Set low swapiness to it is not swapping too often
```bash
sysctl -w vm.swappiness=5
vm.swappiness = 5
```

check
```bash
free -h
               total        used        free      shared  buff/cache   available
Mem:           7.7Gi       460Mi       6.0Gi        20Mi       1.3Gi       7.0Gi
Swap:           14Gi          0B        14Gi
```