---
created: 2022-05-09T12:33:55+05:30
updated: 2022-05-20T10:32:35+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# FSx
- Allows us to launch **3rd party high-performance file systems** on AWS
- Useful when we don’t want to use an AWS managed file system like S3
- **Can be accessed from your on-premise infrastructure**

## FSx for Windows
- Shared File System for Windows (like EFS but for Windows)
- Supports **SMB** protocol, Windows **NTFS**, Microsoft **Active Directory** integration, ACLs, user quotas
- Built on SSD, scale up to 10s of GB/s, millions of IOPS, 100s PB of data
- Supports Multi-AZ (high availability)
- Data is backed-up daily to S3
- **Does not integrate with S3** (cannot store cold data)

## FSx for Lustre
- Parallel distributed file system for **HPC** (like EFS but for HPC)
- Scales up to 100s GB/s, millions of IOPS, sub-ms latencies
- **Only works with Linux**
- **Seamless integration with S3**
    - Can read S3 buckets as a file system (through FSx)
    - Can write the output back to S3 (through FSx)
- Ability to both process the **hot data** in a parallel and distributed fashion as well as easily store the **cold data** on Amazon S3

## FSx Deployment Options
- **Scratch File System**
	- Temporary storage (cheaper)
	- Data is not replicated (data lost if the file server fails)
	- High burst (6x faster than persistent file system)
	- Usage: short-term processing 
- **Persistent File System**
	- Long-term storage (expensive)
	- Data is replicated within same AZ
	- Failed files are replaced within minutes
	- Usage: long-term processing, sensitive data