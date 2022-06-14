---
created: 2022-05-12T22:41:35+05:30
updated: 2022-05-20T15:23:50+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Site-to-Site VPN
- Easiest and most cost-effective way to connect a VPC to an on-premise data center
- **IPSec Encrypted** connection through the public internet
- **Virtual Private Gateway (VGW)**: VPN concentrator on the VPC side of the VPN connection
- **Customer Gateway (CGW)**: Software application or physical device on customer side of the VPN connection
- If you need to ping EC2 instances from on-premises, make sure you add the **ICMP protocol** on the inbound rules of your security groups
![[attachments/Pasted image 20220512224053.png]]

## VPN CloudHub
- **Low-cost hub-and-spoke model** for **network connectivity between a VPC and multiple on-premise data centers**
- Every participating network can communicate with one another through the VPN connection
![[attachments/Pasted image 20220512224648.png]]