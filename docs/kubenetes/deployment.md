### Definition

Provide a declarative way of updating Pods via ReplicaSets in a controlled manner

- Declarative Approach
A manifest file is created for the deployments contains the desired state for the system

- Updating Pods
It updates the pods

- Via ReplicaSets
Declarative way of ensuring that a specified number of pod replicas are running at any given time

Fields - selector, number of replicas, and pod template

- In a controlled manner
Decide updating of pods

### Replication controller

Limitations:
- Not possible to update the new pod replicas to the new version
- No control on how many pods to be updated "at a time"
  
=> no strategy for deployment in Replication controller  

### Rolling deployment

A deployment strategy where the pods get updated in an increment fashion. So the updates are not done "all at a time0"
  
Strategy type: `RollingUpdate`

The deployment creates a separate or new replica set to deploy the pods using the new version

### Rollout Command

```
# Get status of rollout deployment
kubectl rollout status

# Rollback deployment to previsou version/ state
kubectl rollout undo

# Pause the deployment
kubectl rollout pause

# Resume the deployment
kubectl rollout resume

# Check the revision of rollout deployment
kubectl rollout history
```

#### Compare Deployment Strategy

![alt text](https://github.com/sonlh-0262/deploy-repo/blob/master/docs/assets/Screenshot%20from%202022-01-01%2015-11-20.png)


### Reasons for Deployment Failures
- Insufficient permissions
- Application runtime misconfiguration
- Image pull errors
- Insufficient quota
- Readiness probe failures


### Deployment Manifest File

```
# deployment.yml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deploy
  labels:
    env: dev
spec:
  replicase: 3
  selector:
    matchLabels:
      env: dev
  template:
    metadata:
      labels:
        env: dev
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
```

Install

```
kubectl create -f deployment.yml

kubectl get deploy my-deploy
kubectl describe deploy my-deploy

# Get ReplicaSet
kubectl get rs my-deploy-123456

# Update deployment
kubectl apply -f deployment.yml
```

### Rolling Deployment

```
# Add in deployment.yml
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 0
```

Get History of revision
```
# Get histroy deployment
kubectl rollout history deploy my-deploy

# Custom history revision
# Run after apply deploy
kubectl annotate deployment.v1.apps/my-deploy kubernetes.io/change-cause="Move to the latest version."

kubectl rollout history deploy my-deploy
```

Rollback 
```
kubectl rollout undo deploy my-deploy
kubectl rollout status deploy my-deploy

kubectl get rs -o=wide

# Undo to a specific revision
kubectl rollout undo deploy my-deploy --to-revision=1
```

### Delete deployment

```
kubectl delete deploy my-deploy
kubectl get rc
```
