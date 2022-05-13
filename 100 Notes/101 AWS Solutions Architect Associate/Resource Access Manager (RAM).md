---
created: 2022-05-11T20:29:40+05:30
updated: 2022-05-13T00:15:49+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Resource Access Manager (RAM)
- Share AWS resources with **other AWS accounts** to avoid resource duplication
- Each participating account manage their own resources
- Participating accounts can’t view, modify, delete resources that belong to other participants or the owner

## Sharing VPC Subnets
-   Allows to have all the resources launched in the same subnet
-   Can only share within the organization
-   Cannot share security groups and default VPC
-   Network is shared
    -   every resource deployed in the subnet can talk to each other using private IP
    -   security groups from other accounts can be referenced
    - Diagram
	    - ![[attachments/Pasted image 20220511203336.png]]