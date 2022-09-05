---
created: 2022-08-30T23:34:51-04:00
updated: 2022-09-04T22:29:32-04:00
---
[[Kubernetes]]

---
# MongoDB & Mongo Express Project

## Components Required
- A MongoDB pod
- A Mongo Express pod
- An external service to allow users to interact with Mongo Express
- An internal service to interface with MongoDB
- ConfigMap for DB URL
- Secret for DB Username and Password
![[attachments/Pasted image 20220830233738.png]]

## Request Flow
![[attachments/Pasted image 20220830233841.png]]

## Creating Components
#### Secrets
- DB username and secrets should be stored in secrets.
- Values in secrets must be base64 encoded - `echo -n "<string-value>" | base64`

mongo-secret.yaml
```yaml
apiVersion: v1
kind: Secret
metadata:
    name: mongodb-secret
type: Opaque
data:
    mongo-root-username: dXNlcm5hbWU=
    mongo-root-password: cGFzc3dvcmQ=
```

#### MongoDB Pod
- DB container is accessed on port 27017
- DB username and password should not be stored in the code. It should be referenced from the secrets. 
- Since the DB username and password are being referenced from the secret, it must be created before the MongoDB Pod.

mongo.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb-deployment
  labels:
    app: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
      - name: mongodb
        image: mongo
        ports:
        - containerPort: 27017
        env:
        - name: MONGO_INITDB_ROOT_USERNAME
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username
        - name: MONGO_INITDB_ROOT_PASSWORD
          valueFrom: 
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password
```

#### Internal Service
- Required by other pods to communicate with the MongoDB pod
- We can write multiple config in the same YAML file by separating them with `---`
- Target port is the port on which DB pod can be connected (27017)
- Service port is the port on which the service is listening (27017)

mongo.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongodb-deployment
  labels:
    app: mongodb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongodb
  template:
    metadata:
      labels:
        app: mongodb
    spec:
      containers:
      - name: mongodb
        image: mongo
        ports:
        - containerPort: 27017
        env:
        - name: MONGO_INITDB_ROOT_USERNAME
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username
        - name: MONGO_INITDB_ROOT_PASSWORD
          valueFrom: 
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password
---
apiVersion: v1
kind: Service
metadata:
  name: mongodb-service
spec:
  selector:
    app: mongodb
  ports:
    - protocol: TCP
      port: 27017
      targetPort: 27017
```

#### ConfigMap
- To store MongoDB URL

mongo-configmap.yaml
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: mongodb-configmap
data:
  database_url: mongodb-service
```

#### Mongo Express Pod
- Since the secret and configMap are being referenced, they must be deployed beforehand.

mongo-express.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-express
  labels:
    app: mongo-express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-express
  template:
    metadata:
      labels:
        app: mongo-express
    spec:
      containers:
      - name: mongo-express
        image: mongo-express
        ports:
        - containerPort: 8081
        env:
        - name: ME_CONFIG_MONGODB_ADMINUSERNAME
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username
        - name: ME_CONFIG_MONGODB_ADMINPASSWORD
          valueFrom: 
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password
        - name: ME_CONFIG_MONGODB_SERVER
          valueFrom: 
            configMapKeyRef:
              name: mongodb-configmap
              key: database_url
```

#### External Service
- To allow users to connect with Mongo Express
- Append the service config to `mongo-express.yaml`
- `type: LoadBalancer` tells the K8s that the service is external and so it is assigned an external IP address
	- By default `type: ClusterIP`, which means the IP is internal (internal service)
- `nodePort` is the port on which the external IP will be open (port on which the application can be accessed externally)
	- Must be in the range `30000` - `32767`

mongo-express.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo-express
  labels:
    app: mongo-express
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo-express
  template:
    metadata:
      labels:
        app: mongo-express
    spec:
      containers:
      - name: mongo-express
        image: mongo-express
        ports:
        - containerPort: 8081
        env:
        - name: ME_CONFIG_MONGODB_ADMINUSERNAME
          valueFrom:
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-username
        - name: ME_CONFIG_MONGODB_ADMINPASSWORD
          valueFrom: 
            secretKeyRef:
              name: mongodb-secret
              key: mongo-root-password
        - name: ME_CONFIG_MONGODB_SERVER
          valueFrom: 
            configMapKeyRef:
              name: mongodb-configmap
              key: database_url
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-express-service
spec:
  selector:
    app: mongo-express
  type: LoadBalancer  
  ports:
    - protocol: TCP
      port: 8081
      targetPort: 8081
      nodePort: 30000
```