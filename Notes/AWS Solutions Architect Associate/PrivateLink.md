---
created: 2022-05-12T23:55:42+05:30
updated: 2022-05-13T00:03:40+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# PrivateLink
- Used to expose **services** in one VPC to multiple other VPCs, possibly in **different accounts**
- Should not use VPC peering as we only want to expose a few services
- Requires a **NLB (common) or GWLB in the service VPC** and **ENI in the consumer VPC**
- Use multi-AZ NLB and ENIs in multiple AZ for fault-tolerance

![[attachments/Pasted image 20220512235655.png]]

## Exposing ECS tasks
-   ECS tasks require an ALB. So, we can connect the ALB to the NLB for PrivateLink.
-   Corporate Data Centers will still connect through the VPN or Direct Connect.

![[attachments/Pasted image 20220513000308.png]]