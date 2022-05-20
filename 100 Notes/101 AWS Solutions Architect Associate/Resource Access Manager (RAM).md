---
created: 2022-05-11T20:29:40+05:30
updated: 2022-05-20T23:23:56+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Resource Access Manager (RAM)
- Share AWS resources with **other AWS accounts** to avoid resource duplication
- Each participating account manage their own resources
- Participating accounts can’t view, modify, delete resources that belong to other participants or the owner

## VPC Sharing
- Allows to share **one or more subnets** with other accounts **within the same organization**
- Allows multiple accounts to create resources into shared and **centrally-managed** VPCs
- **Cannot share the whole VPC**
- Network is shared (high degree of interconnectivity)
    -   every resource deployed in the subnet can talk to each other using **private IP**
    -   security groups from other accounts can be referenced
    - Diagram
	    - ![[attachments/Pasted image 20220511203336.png]]