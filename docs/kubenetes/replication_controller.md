### Definition

ReplicationController (RC or RCS) ensures a specified number of pod replicas are running at any one time and are available for use

It is a declarative way of getting the desired state

Error detection and correction

Ease of supervision and management

Supervises multiple pods across multiple nodes

### RC Manifest file

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: my-repcon
spec:
  replicas: 3
  selector:
    env: dev
  template:
    metadata:
      labels:
        course: k8s-basics
    spec:
      containers:
      - name: my-pod
        image: nginx:latest
        ports:
        - containerPort: 80
```

##### S

```
# Create for first time
kubectl create -f repcon.yml
kubectl get rc

# When update rc
kubectl apply -f repcon.yml
kubectl get rc

# Describe rc
kubectl describe rc
```
