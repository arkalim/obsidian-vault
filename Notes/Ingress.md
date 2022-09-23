---
created: 2022-09-04T22:23:05-04:00
updated: 2022-09-12T10:29:07-04:00
---
[[Kubernetes]]

---
# Ingress

## Intro
- Provides rule based routing
- Requests can be received at a single IP address (NLB's IP) and forwarded to the right service based on the path or subdomain.
	- ![[attachments/Pasted image 20220912101826.png]]

## Sample YAML
![[attachments/Pasted image 20220904223108.png]]
- Here, we define **routing rules** for the hostname
- Backend is the target where the incoming requests for that hostname will be redirected

## Ingress & Internal Service Setup
![[attachments/Pasted image 20220904223440.png]]
- ServiceName - name of the internal service
- ServicePort - port on which the internal service is available

## Ingress Controller
- A pod or a set of pods that act as the entry point to the cluster and evaluate ingress rules & manage redirections
- Ingress component cannot do anything by itself, it needs an ingress controller which is an implementation for ingress component.
- Example:
	- K8s Nginx Ingress Controller
	- 3rd party
- Image
	- ![[attachments/Pasted image 20220904224433.png]]

## Setup & Configuration
- **On Cloud**
	- Cloud provider's load balancer acts as the entry point and forwards request to ingress controller (managed solution, minimal effort)
	- Image
		- ![[attachments/Pasted image 20220904224738.png]]
- **On Premise**
	- Need to configure entry point ourselves
	- External proxy server (hardware or software) acting as the entry point (has external IP address)
	- None of the nodes in the cluster have external IP addresses (for security)
	- Image
		- ![[attachments/Pasted image 20220904225310.png]]

## Default Backend in Ingress
- If a request does not match any rule, the ingress controller redirects it to the
   `default-http-backend` service. If it doesn't exist, 404 error is returned. 
- This is useful to display a custom "Page doesn't exist" error message.
- Default backend can be created by creating a pod with the same name as the default http backend and on the same port.
- Image
	- ![[attachments/Pasted image 20220904230006.png]]

## Routing to multiple paths
![[attachments/Pasted image 20220904230551.png]]

## Routing to multiple subdomains
![[attachments/Pasted image 20220904230715.png]]

## Configuring TLS Certificate
- TLS Certificate has to be created as a secret in the same namespace as the ingress
- Ingress uses the TLS certificate as a reference from the secret
![[attachments/Pasted image 20220904230853.png]]

## Resources
[(30) Kubernetes Ingress Explained Completely For Beginners - Updated - YouTube](https://www.youtube.com/watch?v=GhZi4DxaxxE)