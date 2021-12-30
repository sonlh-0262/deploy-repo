## Master
### Pre install
```
apt-get update && apt-get install -y docker.io

apt-get install -y apt-transport-https

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
=> OK

cat <<EOF> /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
```

### Install kubeadm, kubelet, kubectl
```
apt-get install -y kubeadm kubelet kubectl
```

### Setup master
```
kubeadm init
```

Check
```
kubectl get nodes
kubectl get pods --all-namespace
```

Setup port network like links
https://kubernetes.io/docs/concepts/cluster-administration/addons/

Using `Calico`: https://projectcalico.docs.tigera.io/about/about-calico

Check cluster info
```
kubectl cluster-info
```

## Node
Include kubelet, container runtime, kubeproxy
