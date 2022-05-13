---
created: 2022-05-13T10:42:42+05:30
updated: 2022-05-13T21:52:02+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# DataSync
- Move data from your **on-premises NAS or file system** via **NFS** or **SMB** protocol to AWS over the **public internet using TLS**
- Can synchronize to: 
	- S3 (all storage classes)
	- EFS
	- FSx for Windows
- **Scheduled Replication** (not continuous)
- Need to install **AWS DataSync Agent** on premises
- Diagram
	- ![[attachments/Pasted image 20220513214950.png]]
- Can also be used to transfer between two EFS in different regions
	- ![[attachments/Pasted image 20220513215131.png]]