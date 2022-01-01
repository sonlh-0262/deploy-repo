### Definition


### Setup service.yml

```
apiVersion: v1
kind: Service
metadata:
  name: my-svc
  labels:
    env: dev
spec:
  type: NodePort
  ports:
  - port: 80
    nodePort: 30150
    protocol: TCP
Selector:
  env: dev
```

### Get service

```
kubectl get svc
kubectl describe svc my-svc
```

### Delete service
```
kubectl delete svc my-svc
```
