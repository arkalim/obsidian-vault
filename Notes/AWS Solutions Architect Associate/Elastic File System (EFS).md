---
created: 2022-05-06T20:18:34+05:30
updated: 2022-05-19T21:55:19+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]
[[Elastic Compute Cloud (EC2)]]

---
# Elastic File System (EFS)
- AWS managed Network File System (NFS)
- Can be mounted to multiple EC2 instances **across AZs**
- **Pay per use** (no capacity provisioning)
- **Auto scaling** (up to PBs)
- Compatible with **Linux** based AMIs (**POSIX** file system)
- **Uses security group to control access to EFS**
- Lifecycle management feature to move files to **EFS-IA** after N days

## Performance Mode
- **General Purpose** (default)
	- latency-sensitive use cases (web server, CMS, etc.)
- **Max I/O**
	- higher latency & throughput (big data, media processing)

## Throughput Mode
-   **Bursting** (default)
    - Throughput: 50MB/s per TB
	- Burst of up to 100MB/s.
-   **Provisioned**
    - Fixed throughput (provisioned)

## Storage Tiers
-   **Standard** - for frequently accessed files
-   **Infrequent access (EFS-IA)** - cost to retrieve files, lower price to store

## Security
- **EFS Security Groups** to control network traffic
- **POSIX Permissions** to control access from hosts by IAM User or Group