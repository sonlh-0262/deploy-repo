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
