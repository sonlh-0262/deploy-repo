### Pods Manifest File:

```
# pods.yml

---
apiVersion: v1
kind: Pod
metadata:
  name: nginx-pod
  labels:
    env: dev
    version: v1
spec:
  containers:
  - name: my-nginx
    image: nginx:latest
    ports:
    - containerPort: 80
```

### Install
Go to master kubernetes:

```
kubectl get nodes
kubectl create -f pods.yml

# show pods
kubectl get pods
kubectl get pods -o=wide
kubectl get pods -o=wide --sort-by="{.spec.nodeName}"

# show detail of pods
kubectl describe pods nginx-pod
```

### Specific action

```
# Set label node
kubectl get nodes
kubectl label nodes node_name key=value

# Show label
kubectl get nodes --show-labels

# Change pods.yml
Add nodeSelector:

spec:
  containers:
  - name: my-nginx
    image: nginx:latest
    ports:
    - containerPort: 80
  nodeSelector:
    az: b
```

### Delete pod

```
# Delete one pod
kubectl delete pods pod_name

# Delete pods
kubectl delete pods --all
```
