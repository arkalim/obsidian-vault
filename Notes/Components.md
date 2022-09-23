---
created: 2022-08-28T10:17:46-04:00
updated: 2022-09-12T10:14:08-04:00
---
[[Kubernetes]]

---
# Components

#### Node
- A physical or virtual machine running pods
- Worker servers in K8 cluster

#### Pod
- Smallest unit of [[Kubernetes]]
- Abstraction over a container 
- Creates a running environment over the container so that we only interact with the Kubernetes layer. This allows us to replace the container technology like Docker.
- Usually, only 1 application is run on a pod
- Each pod gets a unique internal IP address for communicating with each other (virtual network created by K8)
- If a pod is restarted (maybe after the application running on it crashed), its IP address changes
- Image
	- ![[attachments/Pasted image 20220828102630.png]]

#### Service
- **Static IP address** that can be attached to pods
- Pods communicate with each other using services
- Lifecycle of pod and service are not connected. So even if a pod dies, we can restart it and attach the original service to have the same IP.
- Service could be:
	- **ClusterIP**
		- Enables access to the service from within the K8s cluster (internal)
		- Every service created in Kubernetes has a cluster IP
	- **NodePort**
		- Every node in the cluster has a public IP
		- Assigns a port to the service (external requests going to any node at that port will be routed to the service)
		- Limitations 
			- If a node goes down it's public IP might change when restarted
			- One port per service
		- Image
			- ![[attachments/Pasted image 20220912100744.png]]
	- **LoadBalancer**
		- Depends on how the cloud provider is providing their Kubernetes service
		- Spins up a [[AWS Solutions Architect Associate/Elastic Load Balancer (ELB)#Network Load Balancer NLB| Network Load Balancer]] for each service. Requests going to the NLB's IP will be routed to the service.
		- Limitations:
			- One NLB IP per service
			- If the number of services increase, need to add a lot of NLBs (expensive)
- Multiple pods could be connected to a service. In this case, the service acts as a load balancer.

#### Ingress
- DNS for K8
- Used to route traffic into the K8 cluster
- Allows us to use domain names instead of IPs
- The request first goes to ingress and is then forwarded to service
- Image
	- ![[attachments/Pasted image 20220904222518.png]]

#### ConfigMap
- External configuration to the application
- Used to store parameters like DB_URL
- Not for storing secrets (DB_USER, DB_PASS)
- Can be connected to the pod to get parameters (configs)

#### Secret 
- Used to store secrets (DB_USER, DB_PASS)
- Base 64 encoded
- Built-in security mechanism is not enabled by default
- Can be connected to the pod to get secrets
- Image
	- ![[attachments/Pasted image 20220828110943.png]]

#### Volume
- If the database container or pod gets restarted, the stored data would be lost
- A volume (persistent storage) could be attached to the database pod
- Volume could be:
	- local (on the same node as the DB pod)
	- remote (outside the K8 cluster, could be a cloud storage)
- Image
	- ![[attachments/Pasted image 20220828111746.png]]

#### Deployment
- Blueprint for stateless pods (application layer)
- Deployment specifies how many replicas of a pod will be running
- Databases can't be replicated using deployments (because they are stateful)

#### StatefulSet
- Blueprint for stateful pods (database layer)
- Database pods should be created using StatefulSets (not Deployments)
- Would take care of replicating the DB pods or scaling them while ensuring database consistency
- Working with StatefulSets is tedious. So, it is a common practice to host databases outside the K8 cluster and use K8 for hosting stateless applications.