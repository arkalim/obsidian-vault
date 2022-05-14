---
created: 2022-05-09T13:08:31+05:30
updated: 2022-05-14T19:53:41+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Storage Gateway
- Bridge between on-premises data and [[Simple Storage Service (S3)|S3]]
- Not suitable for one-time sync of large amounts of data (use [[DataSync]] instead)
- Optimizes data transfer by sending only changed data

## Types of Storage Gateway

#### S3 File Gateway
-   Used to expand on-premise storage by leveraging S3
-   Configured S3 buckets are accessible on premises using the NFS and SMB protocol
-   **Supports S3 standard, S3 IA, S3 One Zone IA**
-   Bucket access using lAM roles for each File Gateway
-   **Data is cached at the file gateway** for low latency access
-   Can be mounted on many servers on-premises
-   Integrated with Active Directory (AD) for user authentication
- Diagram
	- ![[attachments/Pasted image 20220509131940.png]]

#### Volume Gateway
-   Used to backup on-premise storage volumes as EBS snapshots in S3
-   Uses **iSCSI protocol**
-   Two kinds of volumes:
    -   **Cached volumes**: low latency access to most recent data
    -   **Stored volumes**: entire dataset is on premise, scheduled backups to S3
- Diagram
	- ![[attachments/Pasted image 20220509132530.png]]

#### Tape Gateway
- Used to backup on-premises data using tape-based process to S3 as Virtual Tapes
- Uses **iSCSI protocol**
- Diagram
	- ![[attachments/Pasted image 20220509132930.png]]

#### FSx File Gateway
- Used to expand on-premise storage by leveraging FSx for Windows
- Windows native compatibility (SMB, NTFS, Active Directory)
- **Data is cached at the file gateway** for low latency access
- Diagram
	- ![[attachments/Pasted image 20220509133356.png]]

## Storage Gateway - Hardware Appliance
-   Storage Gateway requires on-premises virtualization. If you don’t have virtualization available, you can use a Storage Gateway - Hardware Appliance. It is a mini server that you need to install on-premises.
-   **Does not work with FSx File Gatway**