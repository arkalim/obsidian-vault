---
created: 2022-05-06T19:20:15+05:30
updated: 2022-05-19T21:45:09+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]
[[Elastic Compute Cloud (EC2)]]

---
# Elastic Block Storage (EBS)
- Volume **Network Drive** (provides low latency access to data)
- Can only be mounted to 1 instance at a time (except EBS multi-attach)
- **Bound to an AZ**
- Must provision capacity in advance (size in GB & throughput in IOPS)
- By default, upon instance termination, the root EBS volume is deleted and any other attached EBS volume is not deleted (can be over-ridden using `DeleteOnTermination` attribute)
- To replicate an EBS volume across AZ or region, need to copy its snapshot
- EBS Multi-attach allows the same EBS volume to attach to multiple EC2 instances **in the same AZ**

> `DeleteOnTermination` attribute can be updated for the root EBS volume only from the CLI

## Volume Types
#### General Purpose SSD
- Good for system boot volumes, virtual desktops
- Storage: 1 GB - 16 TB
- **gp3**
	- **3,000 lOPS baseline** (max 16,000 - independent of size)
	- 125 MiB/s throughput (max 1000MiB/s - independent of size)
- **gp2**
	- **Burst IOPS up to 3,000**
	- **3 IOPS per GB**
	- **Max IOPS: 16,000** (at 5,334 GB)
#### Provisioned IOPS SSD**
- Optimized for **Transaction-intensive Applications** with high frequency of **small & random IO operations**. They are sensitive to increased I/O latency.
- Maintain high IOPS while keeping I/O latency down by maintaining a **low queue length** and a high number of IOPS available to the volume.
- **Supports EBS Multi-attach** (not supported by other types)
- **io1** or **io2**
	-   Storage: **4 GB - 16 TB**
	-   Max IOPS: **64,000 for Nitro EC2 instances** & **32,000 for non-Nitro**
	-   **50 lOPS per GB** (64,000 IOPS at 1,280 GB)
	-   io2 have more durability and more IOPS per GB (at the same price as io1)
- **io2 Block Express**
	-   Storage: 4 GiB - **64 TB**
	-   Sub-millisecond latency
	-   Max IOPS: 256,000
	-   1000 lOPS per GB
#### Hard Disk Drives (HDD)
- Optimized for **Throughput-intensive Applications** that require **large & sequential IO operations** and are less sensitive to increased I/O latency (big data, data warehousing, log processing)
- Maintain high throughput to HDD-backed volumes by maintaining a **high queue length** when performing large, sequential I/O
- **Cannot be used as boot volume** for an EC2 instance
- Storage: 125 MB - 16 TB
- **Throughput Optimized HDD (st1)**
	- Optimized for large sequential reads and writes (Big Data, Data Warehouses, Log Processing)
	- **Max throughput: 500 MB/s**
	- **Max IOPS: 500**
-   **Cold HDD (sc1)**
	- For infrequently accessed data
	- Cheapest
	- **Max throughput: 250 MB/s**
	- **Max IOPS: 250**

## Encryption
- Optional
-   For Encrypted EBS volumes
    -   Data at rest is encrypted
    -   **Data in-flight between the instance and the volume is encrypted**
    -   All snapshots are encrypted
    -   All volumes created from the snapshot are encrypted
- Encrypt an un-encrypted EBS volume
	-   Create an EBS snapshot of the volume
    -   Copy the EBS snapshot and encrypt the new copy
    -   Create a new EBS volume from the encrypted snapshot (the volume will be automatically encrypted)

> All EBS types and all instance families support encryption but not all instance types support encryption.

## Snapshots
- **Data Lifecycle Manager (DLM)** can be used to automate the creation, retention, and deletion of snapshots of EBS volumes
- Snapshots are incremental
- Only the most recent snapshot is required to restore the volume

## RAID
- **RAID 0**
	- Improve performance of a storage volume by distributing reads & writes in a stripe across attached volumes
	- If you add a storage volume, you get the straight addition of throughput and IOPS
	- For high performance applications
- **RAID 1**
	- Improve data availability by mirroring data in multiple volumes
	- For critical applications