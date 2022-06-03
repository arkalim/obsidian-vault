---
created: 2022-05-12T22:48:47+05:30
updated: 2022-05-20T15:44:41+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Direct Connect (DX)
- Dedicated private connection from an on-premise data center to a VPC
	- ![[attachments/Pasted image 20220512233459.png]]
- **Data in transit is not-encrypted** but the connection is private (secure)
- More stable and secure than Site-to-Site VPN
- Access public & private resources on the same connection using **Public & Private Virtual Interface (VIF)** respectively
- Connection to a data center is made from a **Direct Connect Location**
- Connects to a Virtual Private Gateway (VGW) on the VPC end
- Supports both IPv4 and IPv6
- Supports **Hybrid Environments** (on premises + cloud)
- **Lead time > 1 month**

## Connection Types
-   **Dedicated Connection**
    -   **1 Gbps and 10 Gbps** (fixed capacity)
    -   Physical ethernet port dedicated to a customer
-   **Hosted Connection**
    -   **50Mbps, 500 Mbps, up to 10 Gbps**
    -   **On-demand capacity scaling** (more flexible than dedicated connection)

## Encryption
- For encryption in flight, use AWS Direct Connect + VPN which provides an **IPsec-encrypted private connection**
	- ![[attachments/Pasted image 20220512234026.png]]
- Good for an extra level of security

## Resiliency
- **Best way** (redundant direct connect connections)
	- ![[attachments/Pasted image 20220512234246.png]]
- **Cost-effective way** (VPN connection as a backup)
	- Implement an **IPSec VPN** connection and use the **same BGP prefix**. Both the Direct Connect connection and IPSec VPN are active and being advertised using the Border Gateway Protocol (BGP). The **Direct Connect link will always be preferred** unless it is unavailable.

## Direct Connect Gateway
- Used to setup a Direct Connect to multiple VPCs, possibly in **different regions** but **same account**
- Using DX, we will create a Private VIF to the Direct Connect Gateway which will extend the VIF to Virtual Private Gateways in multiple VPCs (possibly across regions).
	- ![[attachments/Pasted image 20220512234818.png]]