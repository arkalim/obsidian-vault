---
created: 2022-05-13T00:47:52+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Traffic Mirroring
- Capture and inspect network traffic in your [[Virtual Private Cloud (VPC)|VPC]] without disturbing the normal flow of traffic
- Inbound and outbound traffic through ENIs (eg. attached to EC2 instances) will be mirrored to the destination (NLB) for inspection without affecting the original traffic.
- Capture the traffic
    - From (Source) ENIs
    - To (Targets) an ENI or [[Elastic Load Balancer (ELB)#Network Load Balancer NLB|NLB]]
-   Source and Target can be in the same or different VPCs (**VPC Peering**)
-   Use cases: **content inspection**, **threat monitoring**, troubleshooting, etc.

![[attachments/Pasted image 20220513004847.png]]