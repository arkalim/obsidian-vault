---
created: 2022-08-29T19:15:49-04:00
updated: 2022-08-30T23:26:51-04:00
---
[[Kubernetes]]

---
# Kubernetes Config File
- YAML config file to create and maintain components in a Kubernetes cluster
- It has 3 parts
	- **Metadata**
	- **Specification**
	- **Status**
		- Stores the actual state of the component
		- Automatically generated and added by K8s from the **etcd** which stores the status info of every component in the K8s cluster

## Sample Config File
nginx-deployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:            # label the deployment
    app: nginx
spec:                # specifications for the deployment
  replicas: 2
  selector:          # connect all pods with the given label
    matchLabels:
      app: nginx
  template:          # configuration for the pods (config inside config)
    metadata:
      labels:
        app: nginx   # label all the pods
    spec:            # specifications for the pods
      containers:
      - name: nginx
        image: nginx:1.16
        ports:
        - containerPort: 8080  # port at which the container is running
```

nginx-service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:          # connect the service with the labelled deployment
    app: nginx
  ports:
    - protocol: TCP
      port: 80          # port at which the service could be contacted
      targetPort: 8080  # port at which pods can be contacted
```

## Connecting Components
- Metadata contain **labels** which give key-value pairs to components
- Specifications contain **selectors** which select and connect components based on the labels
- Ports connect Services with Pods. 
	- ![[attachments/Pasted image 20220830222705.png]]

## Checking connection
**Describe the service**
The endpoints give the IP address and port of the pods that the service will forward the requests to.
```
❯ kubectl describe service nginx-service
Name:              nginx-service
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          app=nginx
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.105.39.212
IPs:               10.105.39.212
Port:              <unset>  80/TCP
TargetPort:        8080/TCP
Endpoints:         172.17.0.3:8080,172.17.0.4:8080
Session Affinity:  None
Events:            <none>
```

## Get the result of deployment
```
kubectl get deployment nginx-deployment -o yaml
```
```
kubectl get deployment nginx-deployment -o yaml > nginx-deployment-result.yaml
```
Check the status of the config file.
```
status:
  availableReplicas: 2
  conditions:
  - lastTransitionTime: "2022-08-31T03:12:52Z"
    lastUpdateTime: "2022-08-31T03:12:52Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2022-08-31T03:12:51Z"
    lastUpdateTime: "2022-08-31T03:12:52Z"
    message: ReplicaSet "nginx-deployment-6986574f5f" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 1
  readyReplicas: 2
  replicas: 2
  updatedReplicas: 2
```