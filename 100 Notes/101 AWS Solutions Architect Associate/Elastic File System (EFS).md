---
created: 2022-05-06T20:18:34+05:30
updated: 2022-05-10T23:46:50+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]
[[Elastic Compute Cloud (EC2)]]

---
# Elastic File System (EFS)
- AWS managed Network File System (NFS)
- Can be mounted to multiple EC2 instances **across AZs**
- **Pay per use** (no capacity provisioning)
- **Auto scaling** (up to petabytes)
- Compatible with Linux based AMIs (**POSIX** file system)
- **Uses security group to control access to EFS**
- Lifecycle management feature to move files to EFS-IA after N days

## Performance Mode
- **General Purpose** (default)
	- latency-sensitive use cases (web server, CMS, etc.)
- **Max I/O**
	- higher latency & throughput (big data, media processing)

## Throughput Mode
-   **Bursting** (default)
    - 50MB/s throughput per TB storage
	- Burst of up to 100MB/s.
-   **Provisioned**
    - Fixed throughput (provisioned)

## Storage Tiers
-   **Standard** - for frequently accessed files
-   **Infrequent access (EFS-IA)** - cost to retrieve files, lower price to store