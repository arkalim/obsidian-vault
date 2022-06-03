---
created: 2022-05-06T20:45:21+05:30
updated: 2022-05-20T23:31:48+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Concepts
## Scalability
-   Ability to handle greater loads by adapting
-   **Vertical Scalability** (scaling up / down)
	-   increasing the size (performance) of the instance
	-   used in non-distributed systems, such as a database.
	-   limited by hardware
-   **Horizontal Scalability** (elasticity) (scaling out / in)
	-   increasing the number of instances of the application
	-   used in distributed systems
	-   easier to achieve than vertical scalability

## High Availability
- Ability to survive a hardware or AZ failure
- Achieved by running at least 2 instances of the application in different AZs
- Cost effective way of implementing HA
	- Stateless
		- Create a system where only 1 EC2 instance stays active at a time. If the instance goes down, ASG will start a new one. Also, the EC2 instance will issue an API call to attach the Elastic IP based on tag.
		![[attachments/Pasted image 20220513222823.png]]
	- Statefull
		- The EC2 instance maintains state in an EBS volume (attached to an AZ). If the instance goes down, create a snapshot of the EBS volume which will be triggered on ASG Terminate lifecycle hook. Similarly, when a new instance is spun up, create a new EBS volume in the appropriate instance using the ASG Launch lifecycle hook.
		![[attachments/Pasted image 20220513222928.png]]
## DNS
- Translates the human friendly hostnames into the machine IP addresses
- **Terminologies**
	- Domain Registrar: registers domain names (Amazon Route 53, GoDaddy, etc.)
	- DNS Records: A, AAAA, CNAME, NS, etc.
	- Hosted Zone: contains DNS records (used to match hostnames to IP addresses)
	- Name Server (NS): resolves DNS queries (Authoritative or Non-Authoritative)
	- Top Level Domain (TLD)
	- Second Level Domain (SLD)
- **Domain Name Structure**
	- ![[attachments/Pasted image 20220507120353.png]]
- **How DNS works**
	- Your web browser wants to access the domain example.com which is being served by a server at IP 9.10.11.12. Your browser will first query the local DNS server which if it has that domain cached, it will return it right away. Otherwise, it will ask the same question to the Root DNS server. The root DNS server will extract the TLD (.com) from the domain and direct the local DNS to the TLD DNS Server that can serve .com TLD. The query to the TLD DNS server will be the same. The TLD DNS server returns the IP of the SLD DNS server which can store the IP of web server hosting example.com. Once again the same query is made to the SLD DNS Server which returns the IP 9.10.11.12 instead of NS (named server).
	- ![[attachments/Pasted image 20220507120627.png]]

## Cross-Origin Resource Sharing (CORS)
-   An origin is a combination of scheme (protocol), host (domain) and port. 
  Eg: https://www.example.com (implied port is 443 for HTTPS, 80 for HTTP)
  Same origin: http://example.com/google & http://example.com/yahoo
  Different origins: http://google.example.com & http://yahoo.example.com
  
-   CORS is a **web browser based security** to allow requests to other origins while visiting the main origin only if the other origin allows for the requests from the main origin, using CORS Headers (`Access-Control-Allow-Origin` & `Access-Control-Allow-Methods`)

-   In the diagram below, web browser is on www.example.com and the server wants to redirect it to www.other.com In this case, the web browser will first send a preflight request to www.other.com via OPTIONS method, which requests permitted communication options for a given URL or server (www.example.com). The cross origin server responds with the methods that www.example.com is allowed to perform.
	- ![[attachments/Pasted image 20220507175132.png]]

## Database
- **Durability** defines what are the chances of DB losing some stored data
- **Availability** defines how readily available data stored in the DB is

## Unicast vs Anycast IP
- **Unicast IP**: one server holds one IP address
-  **Anycast IP**: all servers hold the same IP address and the client is routed to the nearest one

## Hybrid Cloud
- Part of your infrastructure is on the cloud and the rest is on-premises
- This can be due to
    -   Long cloud migrations
    -   Security requirements
    -   Compliance requirements

## Application Communication
-   **Synchronous (application → application)**
	- Can be problematic if there are sudden spikes of traffic and one of the services gets overwhelmed
-   **Asynchronous / Event-based (application → queue → application)**    
	- Allows applications to scale independently to handle spikes in traffic

![[attachments/Pasted image 20220509194411.png]]

## Kubernetes
- Kubernetes is an **open-source** system for automatic deployment, scaling and management of containerized (usually Docker) applications
- Kubernetes is **cloud-agnostic** (can be used in any cloud provider). So, it is much more standardized.

## Serverless
-   Serverless is a new paradigm in which the developers don’t have to provision or manage servers. They just deploy code.

## Micro-Services Architecture
-   Many services interact with each other directly using a REST API
-   Allows us to have a leaner development lifecycle for each service
-   Services can scale independently of each other
-   Each service has a separate code repository (easy for development)
-   Communication between services:
    -   Synchronous patterns: API Gateway, Load Balancers
    -   Asynchronous patterns: SQS, Kinesis, SNS

## Microsoft Active Directory (AD)
- It is a way to share login credentials of the users with all the machines within the network.
- Objects are organized in trees. A group of trees is a forest
- There is a domain controller. We will create an account there. Since each windows machine on the network is connected to the domain controller, this user can be logged in from any machine on the network.

## Ephemeral Ports
When a client sends an HTTP request to a server, it does so on a fixed IP and port of the server. In the request, the client also sends a temporary port for the server to respond back. The server when sending the response uses this port which is only lived for the duration of this HTTP connection.
![[attachments/Pasted image 20220512210852.png]]

## IPv6
-   IPv4 designed to provide 4.3 Billion addresses (they’ll be exhausted soon)
-   IPV6 is designed to provide 3.4 x 10^38 unique IP addresses
-   **Every IPv6 address is public and Internet-routable (no private range)**
-   Format x.x.x.x.x.x.x.x (x is hexadecimal, range can be from 0000 to ffff)
-   Examples:
    -   2001:db8:3333:4444:5555:6666:7777:8888
    -   2001:db8:3333:4444:cccc:dddd:eeee:ffff
    -   :: ⇒ all 8 segments are zero
    -   2001:db8:: ⇒ the last 6 segments are zero
    -   ::1234:5678 ⇒ the first 6 segments are zero
    -   2001:db8::1234:5678 ⇒ the middle 4 segments are zero