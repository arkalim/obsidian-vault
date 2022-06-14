---
created: 2022-05-18T22:17:37+05:30
updated: 2022-05-18T22:26:19+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Cost Effective Highly Available Monolithic Architecture

## Stateless
- Only 1 EC2 instance stays active at a time and can be accessed using an **Elastic IP** (static)
- If the instance goes down, ASG will start a new one in another AZ. 
- The newly launched EC2 instance will issue an API call to attach the Elastic IP based on tag using the EC2 user data. 
- **Should not use ALB** as the traffic only needs to be routed to a single instance (cost effective)
![[attachments/Pasted image 20220518222221.png]]

## Stateful
- The EC2 instance maintains state in an EBS volume (attached to an AZ). If the instance goes down, create a snapshot of the EBS volume which will be triggered on **ASG Terminate lifecycle hook**. Similarly, when a new instance is spun up, create a new EBS volume in the appropriate instance using the **ASG Launch lifecycle hook**.
![[attachments/Pasted image 20220518222310.png]]