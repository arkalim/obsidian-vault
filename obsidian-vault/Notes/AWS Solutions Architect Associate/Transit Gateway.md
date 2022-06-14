---
created: 2022-05-13T00:09:08+05:30
updated: 2022-05-20T16:55:56+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Transit Gateway
- **Transitive peering** between thousands of VPCs and on-premise data centers using **hub-and-spoke (star) topology**
- Works with **Direct Connect Gateway**, **VPN Connection** and **VPC**
- **Bound to a region** 
- Transitive peering between VPCs in **same region & account**
- **Route Tables** to control communication within the transitive network
- Supports **IP Multicast** (not supported by any other AWS service)
- Diagram
	- ![[attachments/Pasted image 20220513002130.png]]

## Increasing BW of Site-to-Site VPN connection
-   **ECMP** (equal-cost multi-path) routing is a routing strategy to allow to forward a packet over multiple best path
-   To increase the bandwidth of the connection between Transit Gateway and corporate data center, create multiple site-to-site VPN connections, each with 2 tunnels (2 x 1.25 = 2.5 Gbps per VPN connection).
	- ![[attachments/Pasted image 20220513002301.png]]
- Only one VPN connection to a VPC having 2 tunnels out of which only 1 is used (1.25 Gbps)

## Share DX between multiple Accounts
Share Transit Gateway across accounts using [[Resource Access Manager (RAM)|Resource Access Manager]] to share [[Direct Connect (DX)|Direct Connect]] connection between VPCs in the **same region but different accounts**

![[attachments/Pasted image 20220513003853.png]]