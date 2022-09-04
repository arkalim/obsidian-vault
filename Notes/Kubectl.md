---
created: 2022-08-29T18:10:42-04:00
updated: 2022-09-03T23:05:02-04:00
---
[[Kubernetes]]

---
# Kubectl
- Command line tool for K8s cluster
- It communicates via the API server running on the master node or [[Local Cluster Setup#Minikube|Minikube]]
- This is the most powerful way to control the K8s cluster (compared to Kubernetes Dashboard and API) 

## Commands
- List all components - `kubectl get all`
- List nodes - `kubectl get nodes`
- List pods - `kubectl get pods`
- List services - `kubectl get services`
- List deployments - `kubectl get deployments`
- Describe a pod - `kubectl describe pod <pod-name>`
- Create deployment - `kubectl create deployment <deployment-name> --image=nginx`
	- This will download the nginx image from dockerhub and create a deployment with the provided name and the nginx image
	- Here deployment name and the image are the parameters we are passing, the rest will be taken as default to generate the K8s config file.
- Get container logs of a pod - `kubectl logs <pod-name>`
	- The container must be running inside the pod for this command to work.
- Open interactive terminal for a pod - `kubectl exec -it <pod-name> -- bin/bash`
- Delete deployment - `kubectl delete deployment <deployment-name>`
	- Replicasets, Pods and Containers under the deployment will be deleted automatically.
- Create or update a deployment using a [[Kubernetes Config File|K8s config file]] - `kubectl apply -f config.yaml`
- Delete a deployment using a [[Kubernetes Config File|K8s config file]] - `kubectl delete -f config.yaml`
- Get IP address of the pods - `kubectl get pods -o wide`
- Get the result of deployment - `kubectl get deployment nginx-deployment -o yaml`
	- Can also save it to a file - `kubectl get deployment nginx-deployment -o yaml > nginx-deployment-result.yaml`
- Create namespace - `kubectl create namespace <namespace-name>`
- Get namespaces - `kubectl get namespaces`
- List non-namespaced resources - `kubectl api-resources --namespaced=false`
-  
