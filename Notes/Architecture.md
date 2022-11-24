---
created: 2022-08-28T12:22:08-04:00
updated: 2022-10-08T18:56:26-04:00
---
[[Kubernetes]]

---
# Architecture

## Worker Nodes
- These nodes do the actual work (need more resources)
- Each worker node has multiple pods running on it. 
- 3 processes must be installed on every worker node
	- **Container Runtime** (eg. docker)
	- **Kubelet** 
		- process of Kubernetes
		- starts pods and runs containers inside them
		- allocates resources from the node to the container
	- **Kubeproxy**
		- process of Kubernetes
		- forwards the requests to pods intelligently
		- Image
			- Kubeproxy forwards requests to the DB pod running on the same node to minimize network overhead.
			- ![[attachments/Pasted image 20220828123915.png]]
			- 

## Master Nodes
- Control the cluster state & manage worker nodes
- Need less resources as they don't do the actual work
- Usually multi-master for fault tolerance
- 4 processes run on every master node
	- **API Server**
		- User interacts with the cluster via the API server using a client (Kubernetes Dashboard, CLI, or Kubernetes API)
		- Cluster gateway (acts as the entry point into the cluster)
		- Can be used for authentication
		- Image
			- ![[attachments/Pasted image 20220828124843.png]]
	- **Scheduler**
		- Decides the node where the new pod should be scheduled and sends a request to the Kubelet to start a pod.
		- Image
			- ![[attachments/Pasted image 20220828125230.png]]
	- **Controller Manager**
		- Detects state changes like crashing of pods
		- If a pod dies, it requests scheduler to schedule starting up of a new pod
		- Image
			- ![[attachments/Pasted image 20220828125455.png]]
	- **etcd**
		- Key-value store of the cluster state (also known as cluster brain)
		- Cluster changes get stored in the etcd
		- In multi-master configuration, etcd is a distributed key-value store
		- Application data is not stored in the etcd

## Cluster
- A collection of nodes grouped together (if one node goes down, the application can still continue to run)
- In a K8 cluster, master or worker nodes can be added dynamically

## Layers of Abstraction
- Deployment (manages replicasets)
- Replicaset (how many replicas of pods to create)
- Pod
- Container

> [!important] Everything below the Deployment layer is managed by Kubernetes