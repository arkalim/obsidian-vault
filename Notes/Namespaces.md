---
created: 2022-09-03T18:53:35-04:00
updated: 2022-09-04T00:36:42-04:00
---
[[Kubernetes]]

---
# Namespaces
- Used to organize resources
- Virtual cluster inside of a Kubernetes cluster
- Most resources cannot be shared across namespaces
	- ConfigMap
	- Secrets
	- Pods
- [[Components#Service|Services]] can be shared across namespaces
	- ![[attachments/Pasted image 20220903230027.png]]
- Components that don't belong to a namespace. They live globally inside the cluster.
	- Volumes
	- Nodes 

## Default Namespaces
- By default, a K8s cluster has 4 namespaces
	- **kube-system**
		- Contains system, master & kubectl processes
		- Do not create or modify anything in kube-system namespace
	- **kube-public**
		- Contains a configmap, which stores publicly accessible data
	- **kube-node-lease**
		- Contains information about the heartbeats of nodes
		- Each node has an associated lease object which stores information about the availability of that node
	- **default**
		- Default namespace where you will be creating resources

## Custom Namespaces
- You can create a custom namespace using
	- Kubectl - `kubectl create namespace <namespace-name>`
	- KubeConfig file - specify namespace for each component (recommended)
		- ![[attachments/Pasted image 20220904003437.png]]

## Use Cases
- Grouping resources
	- ![[attachments/Pasted image 20220903190603.png]]
- Multiple teams
	- Example: two or more teams working on the same app where each team works in their own namespace without disrupting the other
	- ![[attachments/Pasted image 20220903190751.png]]
- Resource sharing
	- Example: reuse Elastic Stack in both development and staging environments or between blue/green deployment versions
	- ![[attachments/Pasted image 20220903191054.png]]
	- ![[attachments/Pasted image 20220903191308.png]]
- Access limiting 
	- Example: limiting access to dev namespace for support team
	- ![[attachments/Pasted image 20220903225546.png]]
- Resource allocation 
	- Allocate resources (CPU, RAM, etc.) to different namespaces