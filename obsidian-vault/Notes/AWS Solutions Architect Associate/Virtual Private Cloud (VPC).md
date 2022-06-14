---
created: 2022-05-12T09:39:59+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Virtual Private Cloud (VPC)
- Soft limit of 5 VPCs per region
- Only the Private IPv4 ranges are allowed
- AWS accounts have a default VPC
- Default VPC has Internet connectivity and all EC2 instances inside it have public IPv4 addresses and public and a private IPv4 DNS names

> New EC2 instances are launched into the default VPC if no subnet is specified

## Classless Inter-Domain Routing (CIDR)
- Way to define a range of IP addresses
	- ![[attachments/Pasted image 20220512094258.png]]
- Two parts
	- Base IP - 192.168.0.0
	- Subnet Mask (defines how many bits are frozen from the left side) - /16
- Private IP ranges:
    -   10.0.0.0 - 10.255.255.255 (10.0.0.0/8) ⇒ used in big networks (24 bits can change)
    -   172.16.0.0 - 172.31.255.255 (172.16.0.0/12) ⇒ AWS default VPC
    -   192.168.0.0 - 192.168.255.255 (192.168.0.0/16) ⇒ home networks
- Rest of the IP ranges are Public
- **Max 5 CIDR ver VPC**
    -   Min. size is /28 (16 IP addresses)
    -   Max. size is /16 (65536 IP addresses)

## Subnets
- Sub-ranges of IP addresses within the VPC
- **Each subnet is bound to an AZ**
- Subnets in a VPC cannot have overlapping CIDRs
-   **AWS reserves 5 IP addresses (first 4 & last 1) in each subnet**. These 5 IP addresses are not available for use. 
  Example: if CIDR block 10.0.0.0/24, then reserved IP addresses are 10.0.0.0, 10.0.0.1, 10.0.0.2, 10.0.0.3 & 10.0.0.255

> To make the EC2 instances running in private subnets accessible on the internet, place them behind an internet-facing (running in public subnets) Elastic Load Balancer.

> Public subnets are subnets that have:
> -   “Auto-assign public IPv4 address” set to “Yes”
> -   The subnet route table has an attached Internet Gateway

## Internet Gateway (IGW)
- Allows resources in a VPC to connect to the Internet
	- ![[attachments/Pasted image 20220512100002.png]]
- Should be used to connect public resources to the internet (use NAT gateway for private resources)
- Route table of the public subnets must be edited to allow requests destined outside the VPC to be routed to the IGW
	- ![[attachments/Pasted image 20220512222218.png]]
- One IGW per VPC

> IGW performs network address translation (NAT) for a public EC2 instance

## Bastion Hosts
- A EC2 instance running in the public subnet (accessible from public internet), to allow users to SSH into the instances in the private subnet.
	- ![[attachments/Pasted image 20220512100455.png]]
- Security groups of the private instances should only allow traffic from the bastion host.
- Bastion host should only allow port 22 traffic from the IP address you need (**small instances are enough**)

#### High Availability
-   HA options for Bastion Host
    -   Run 2 Bastion Hosts across 2 AZ
    -   Run 1 Bastion Host across 2 AZ with ASG 1:1:1
-   Routing to the bastion host
    -   If 1 bastion host, use an elastic IP with EC2 user-data script to access it
    -   If 2 bastion hosts, use a public-facing NLB (layer 4) deployed in multiple AZ. Bastion hosts can live in the private subnet (more secure)
- Can’t use ALB as it works in layer 7 (HTTP protocol) and SSH works with TCP
- Diagram
	- ![[attachments/Pasted image 20220513222559.png]]

## Network Address Translation (NAT) Instance
- An [[Elastic Compute Cloud (EC2)|EC2]] instance **launched in the public subnet** which allows EC2 instances in private subnets to connect to the Internet without being connected from the internet (blocks inbound connection)
	- ![[attachments/Pasted image 20220512101152.png]]
- **Must disable EC2 setting: source / destination IP check on the NAT instance** as the IPs can change.
- **Must have an Elastic IP attached to it**
- Route Tables for private subnets must be configured to route internet-destined traffic to the NAT instance (its elastic IP)
- **Can be used as a Bastion Host**
- Disadvantages
	- Not highly available or resilient out of the box. Need to create an ASG in multi-AZ + resilient user-data script
	- Internet traffic bandwidth depends on EC2 instance type
	- You must manage [[Elastic Compute Cloud (EC2)#Security Groups|Security Groups]] & rules:
	    - Inbound:
	        -   Allow HTTP / HTTPS traffic coming from Private Subnets
	        -   Allow SSH from your home network (access is provided through Internet Gateway)
	    - Outbound:
	        -   Allow HTTP / HTTPS traffic to the Internet
- Architecture
	- ![[attachments/Pasted image 20220512101803.png]]

## NAT Gateway
- AWS managed NAT with **bandwidth autoscaling** (up to 45Gbps)
- Preferred over NAT instances
- **Uses an Elastic IP** behind the scenes
- **Bound to an AZ**
- **Cannot be used by EC2 instances in the same subnet** (only from other subnets)
- **Cannot be used as a Bastion Host**
- Route Tables for private subnets must be configured to route internet-destined traffic to the NAT gateway
	- ![[attachments/Pasted image 20220512222148.png]]
- No Security Groups to manage
- Pay per hour
- Architecture
	- ![[attachments/Pasted image 20220512204306.png]]
- High Availability
	- Create NAT gateways in public subnets bound to different AZ all routing outbound connections to the IGW (attached to the VPC)
	- No cross-AZ failover needed because if an AZ goes down, all of the instances in that AZ also go down.
	- ![[attachments/Pasted image 20220512204520.png]]

## DNS Resolution in VPC
- Two settings need to be enabled to allow DNS resolution within a VPC:
	- **DNS Support** (enableDnsSupport)
	    -  Allows the resources within the VPC to query the DNS provided by Route 53 Resolver
	    -  **Enabled by default**
	    -  If disabled, we need to provide a custom DNS server otherwise we won’t be able to reach hostnames
	    - Diagram
		    - ![[attachments/Pasted image 20220512210247.png]]
	- **DNS Hostnames** (enableDnsHostnames)
	    -  Assigns **public hostname** to EC2 instances in our VPC if they have a public IPv4
	    -  **Doesn't work until `enableDnsSupport=true`**
	    -  By default
	        - Default VPC - Enabled
	        - Custom VPC - Disabled
	    -   When disabled, instances in the VPC will have a public IP but no public DNS
- If you use custom domain names in a Private Hosted Zone in Route 53, you must enable both of these settings
	- ![[attachments/Pasted image 20220512210613.png]]

## Network Access Control List (NACL)
- NACL are a firewall at the subnet level
- One NACL per subnet but a NACL can be attached to multiple subnets
- **New subnets are assigned the Default NACL**
- **Default NACL allows all inbound & outbound requests**
	- ![[attachments/Pasted image 20220512215745.png]]
- NACL Rules
	- Rules number: 1-32766 (lower number has higher precedence)
	- First rule match will drive the decision
	- The last rule denies the request (only when no previous rule matches)
- NACL vs [[Elastic Compute Cloud (EC2)#Security Groups|Security Group]]
	- NACL
		- Firewall for subnets
		- Supports both Allow and Deny rules
		- Stateless (both request and response will be evaluated against the NACL rules)
		- Only the first matched rule is considered
	- Security Group: 
		- Firewall for EC2 instances
		- Supports only Allow rules
		- Stateful (only request will be evaluated against the SG rules)
		- All rules are evaluated
	- ![[attachments/Pasted image 20220512220220.png]]
- NACL with Ephemeral Ports
	- In the example below, the client EC2 instance needs to connect to DB instance. Since the ephemeral port can be randomly assigned from a range of ports, the Web Subnets’s NACL must allow inbound traffic from that range of ports and similarly DB Subnet’s NACL must allow outbound traffic on the same range of ports.
	- ![[attachments/Pasted image 20220512220647.png]]

## VPC Peering
- Connect two VPCs (could be in **different region or account**) using the AWS private network
	- ![[attachments/Pasted image 20220512221728.png]]
- Participating VPCs must have **non-overlapping CIDR**
- VPC Peering connection is **non-transitive** (A - B, B - C != A - C)
- Must update route tables in each VPC’s subnets to ensure requests destined to the peered VPC can be routed through the peering connection
	- ![[attachments/Pasted image 20220512221946.png]]
	- ![[attachments/Pasted image 20220512221954.png]]
- You can reference a security group in a peered VPC across account or region. This allows us to use SG instead of CIDR when configuring rules.

> VPC Peering does not facilitate centrally-managed VPC like [[Resource Access Manager (RAM)#VPC Sharing|VPC Sharing]]

## VPC Endpoints
- **Private endpoints** within your VPC that allow AWS services to privately connect to resources within your VPC without traversing the public internet (cheaper)
	- ![[attachments/Pasted image 20220512222517.png]]
- Powered by **AWS PrivateLink**
- **Route table is updated automatically**
- **Bound to a region** (do not support inter-region communication)
- Two types:
	- **Interface Endpoint**
		- Provisions an **ENI** (private IP) as an entry point per subnet
		- Need to **attach a security group to the interface endpoint** to control access
		- Supports most AWS services
	- **Gateway Endpoint**
		- Provisions a gateway
		- Must be used as a target in a route table
		- Supports only **S3** and **DynamoDB**

## VPC Flow Logs
- Captures information about **IP traffic** going into your **interfaces**
- Three levels:
    -   **VPC** Flow Logs
    -   **Subnet** Flow Logs
    -   **ENI** Flow Logs
- Can be configured to show accepted, rejected or all traffic
- Flow logs data can be sent to **S3** (bulk analytics) or **CloudWatch Logs** (near real-time decision making)
- Query VPC flow logs using **Athena** in S3 or **CloudWatch Logs Insights**

## IPv6 Support
- IPv4 cannot be disabled for your VPC
- Enable IPv6 to operate in **dual-stack mode** in which your EC2 instances will get at least a **private IPv4** and a **public IPv6**. They can communicate using either IPv4 or IPv6 to the internet through an Internet Gateway.
	- ![[attachments/Pasted image 20220513005218.png]]
- If you cannot launch an EC2 instance in your subnet, It’s not because it cannot acquire an IPv6 (the space is very large). It’s because there are no available IPv4 in your subnet. 
  **Solution: create a new IPv4 CIDR in your subnet**

#### Egress-only Internet Gateway
- Allows instances in your VPC to initiate outbound connections over IPv6 while preventing inbound IPv6 connections to your private instances.
	- ![[attachments/Pasted image 20220513005755.png]]
- Similar to [[Virtual Private Cloud (VPC)#NAT Gateway|NAT Gateway]] but for IPv6
- Must update Route Tables

## VPC Console Wizard
>  - Supported Configurations:
> 	- VPC with a single public subnet
> 	- VPC with public and private subnets (NAT)
> 	- VPC with public and private subnets and AWS Site-to-Site VPN access
> 	- VPC with a private subnet only and AWS Site-to-Site VPN access