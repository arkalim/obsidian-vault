---
created: 2022-05-07T10:10:34+05:30
updated: 2022-06-03T09:19:11+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---

# Aurora
- Regional Service (supports global databases)
- Supports Multi AZ
- AWS managed Relational DB cluster
- Preferred over [[Relational Database Service (RDS)]]
- Auto-scaling (max 128TB)
- Up to 15 read replicas
- **Asynchronous Replication** (milliseconds) 
- **Supports only MySQL & PostgreSQL**
- Cloud-optimized (5x performance improvement over MySQL on RDS, over 3x the performance of PostgreSQL on RDS)
- **Backtrack**: restore data at any point of time without taking backups

## Endpoints
- **Writer Endpoint** (Cluster Endpoint)
	- Always points to the master (can be used for read/write)
	- Each Aurora DB cluster has one cluster endpoint
- **Reader Endpoint**
	- Provides load-balancing for read replicas only (used to read only)
	- If the cluster has no read replica, it points to master (can be used to read/write)
	- Each Aurora DB cluster has one reader endpoint
- **Custom Endpoint**:
	- Used to point to a subset of replicas
	- Provides load-balanced based on criteria other than the read-only or read-write capability of the DB instances like instance class (ex, direct internal users to low-capacity instances and direct production traffic to high-capacity instances)

## High Availability & Read Scaling
-   Self healing (if some data is corrupted, it will be automatically healed)
-   Storage is striped across 100s of volumes (more resilient)
-   **Automated failover**
	- A read replica is promoted as the new master in less than 30 seconds
	- Aurora flips the **CNAME** record for your DB Instance to point at the healthy replica
	- In case **no replica** is available, Aurora will attempt to **create a new DB Instance** in the **same AZ** as the original instance. This replacement of the original instance is done on a **best-effort basis** and may not succeed.
-   Support for **Cross Region Replication**
-   Aurora maintains 6 copies of your data across 3 AZ:
    -   4 copies out of 6 needed for writes (can still write if 1 AZ completely fails)
    -   3 copies out of 6 need for reads

> Each Read Replica is associated with a priority tier (0-15). In the event of a failover, Amazon Aurora will promote the Read Replica that has the highest priority (lowest tier). If two or more Aurora Replicas share the same tier, then Aurora promotes the replica that is largest in size. If two or more Aurora Replicas share the same priority and size, then Aurora promotes an arbitrary replica in the same promotion tier.

## Encryption & Network Security
-   Encryption at rest using KMS (same as RDS)
-   Encryption in flight using SSL (same as RDS)
- You can’t SSH into Aurora instances (same as RDS)
- Network Security is managed using Security Groups (same as RDS)
- EC2 instances should access the DB using [[Relational Database Service (RDS)#Access Management|IAM DB Authentication]] but they can also do it using credentials fetched from the [[SSM Parameter Store]] (same as RDS) 

## Aurora Serverless
- Optional
-   Automated database instantiation and auto scaling based on usage
-   Good for unpredictable workloads
-   No capacity planning needed
-   Pay per second

## Aurora Multi-Master
- Optional
- Every node (replica) in the cluster can read and write
- Used for immediate failover for write node (high availability in terms of write). If disabled and the master node fails, need to promote a Read Replica as the new master (will take some time).
- **Client needs to have multiple DB connections for failover**

## Aurora Global Database
-   Entire database is replicated across regions to recover from region failure
-   Designed for **globally distributed applications** with **low latency local reads** in each region
-   1 Primary Region (read / write)
-   Up to 5 secondary (read-only) regions (replication lag < 1 second)
-   Up to 16 Read Replicas per secondary region
-   Helps for decreasing latency for clients in other geographical locations
- **RTO of less than 1 minute** (to promote another region as primary)

## Aurora Events
- Invoke a **Lambda** function from an **Aurora MySQL-compatible DB cluster** with a **native function** or a **stored procedure** (same as [[Relational Database Service (RDS)#RDS Events|RDS]])
- Used to capture data changes whenever a row is modified