---
created: 2022-05-07T10:10:34+05:30
updated: 2022-05-10T23:47:09+05:30
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
- Supports only MySQL & PostgreSQL
- Cloud-optimized (5x performance improvement over MySQL on RDS, over 3x the performance of PostgreSQL on RDS)
- Endpoints:
	- Writer Endpoint: always points to the master
	- Reader Endpoint: points to the read replicas
	- Custom Endpoint: used to point to a subset of replicas
- **Backtrack**: restore data at any point of time without taking backups

## High Availability & Read Scaling
-   Self healing (if some data is corrupted, it will be automatically healed)
-   Storage is striped across 100s of volumes (more resilient)
-   **Automated failover** for master (a read replica is promoted as the new master in less than 30 seconds)
-   Support for Cross Region Replication
-   Aurora maintains 6 copies of your data across 3 AZ:
    -   4 copies out of 6 needed for writes (can still write if 1 AZ completely fails)
    -   3 copies out of 6 need for reads

## Encryption & Network Security
-   Encryption at rest using KMS (same as RDS)
-   Encryption in flight using SSL (same as RDS)
- You can’t SSH into Aurora (same as RDS)
- Network Security is managed using Security Groups (same as RDS)
- EC2 instances access the DB using [[Relational Database Service (RDS)#Access Management|IAM DB Authentication]] (same as RDS)

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
- Client needs to have multiple DB connections for failover

## Aurora Global Database
-   Optional
-   Entire database is replicated across regions to recover from region failure
-   1 Primary Region (read / write)
-   Up to 5 secondary (read-only) regions (replication lag < 1 second)
-   Up to 16 Read Replicas per secondary region
-   Helps for decreasing latency for clients in other geographical locations
- **RTO (recovery time objective) of less than 1 minute** (to promote another region as primary)