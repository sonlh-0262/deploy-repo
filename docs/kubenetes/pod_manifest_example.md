Pods Manifest File:

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
