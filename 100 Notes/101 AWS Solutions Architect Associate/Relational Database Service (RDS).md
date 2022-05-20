---
created: 2022-05-07T00:25:19+05:30
updated: 2022-05-20T09:30:55+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---

# Relational Database Service (RDS)
- Regional Service
- Supports Multi AZ
- AWS Managed SQL Database
- Supported Engines
	-   Postgres
	-   MySQL
	-   MariaDB
	-   Oracle
	-   Microsoft SQL Server
	-   Aurora (AWS Proprietary database)
- Backed by [[Elastic Compute Cloud (EC2)|EC2]] instances with [[Elastic Block Storage (EBS)|EBS]] storage
- We don't have access to the underlying instance
- **DB connection is made on port 3306**
- Security Groups are used for network security (must allow incoming TCP traffic on port 3306 from specific IPs)

## Backups
-   **Automated Backups** (enabled by default)
    -   Daily full backup of the database (during the defined maintenance window)
    -   Backup retention: 7 days (max 35 days)
    -   Transaction logs are backed-up every **5 minutes** (point in time recovery)
-   **DB Snapshots**:
    -   Manually triggered
    -   Backup retention: unlimited

## Auto Scaling
- Automatically scales the RDS storage within the max limit
- Condition for automatic storage scaling:
    -   Free storage is less than 10% of allocated storage
    -   Low-storage lasts at least 5 minutes
    -   6 hours have passed since last modification

## Read Replicas
- Allows us to scale the read operation (SELECT) on RDS
	- ![[attachments/Pasted image 20220507005920.png]]
- **Up to 5 read replicas** (within AZ, cross AZ or cross region)
- **Asynchronous Replication** (seconds)
- **Replicas can be promoted to their own DB**
- **Applications must update the connection string to leverage read replicas**
- Network fee for replication
	- Same region: free
	- Cross region: paid

> You can create a read replica as a Multi-AZ DB instance. A standby of the replica will be created in another AZ for failover support for the replica.

## Multi AZ
- Increase availability of the RDS database by replicating it to another AZ
	- ![[attachments/Pasted image 20220507010002.png]]
- **Synchronous Replication**
- **Connection string does not require to be updated** (both the databases can be accessed by one DNS name, which allows for automatic DNS failover to standby database)
- When failing over, **RDS flips the CNAME** record for the DB instance to point at the standby, which is in turn promoted to become the new primary.
- **Cannot be used for scaling as the standby database cannot take read/write operation**

## Encryption
- **At rest encryption**
	- KMS AES-256 encryption
	- Encrypted DB  => Encrypted Snapshots, Encrypted Replicas and vice versa
- **In flight encryption**
	- **SSL certificates**
	- Force all connections to your DB instance to use SSL by setting the `rds.force_ssl` parameter to `true`
	- To enable encryption in transit, download the **AWS-provided root certificates** & used them when connecting to DB
- To encrypt an un-encrypted RDS database:
    -   Create a snapshot of the un-encrypted database
    -   Copy the snapshot and enable encryption for the snapshot
    -   Restore the database from the encrypted snapshot
    -   Migrate applications to the new database, and delete the old database
- To create an encrypted cross-region read replica from a non-encrypted master:
	- Encrypt a snapshot from the unencrypted master DB instance
	- Create a new encrypted master DB instance
	- Create an encrypted cross-region Read Replica from the new encrypted master

## Access Management
- Username and Password can be used to login into the database
- EC2 instances & [[Lambda]] functions should access the DB using **IAM DB Authentication** (**AWSAuthenticationPlugin** with **IAM**) - token based access
	- EC2 instance or Lambda function has an IAM role which allows is to make an API call to the RDS service to get the **auth token** which it uses to access the MySQL database.
		- ![[attachments/Pasted image 20220507011632.png]]
	- Only works with **MySQL** and **PostgreSQL**
	- Auth token is valid for 15 mins
	- Network traffic is encrypted in-flight using SSL
	- **Central access management using IAM** (instead of doing it for each DB individually)
- EC2 & Lambda can also get DB credentials from [[SSM Parameter Store]] to authenticate to the DB - credentials based access

## RDS Events
- RDS events only provide operational events on the DB instance (not the data)
- To capture data modification events, use **native functions** or **stored procedures** to invoke a **Lambda** function.

## Monitoring
- **CloudWatch Metrics for RDS**
	- Gathers metrics from the **hypervisor** of the DB instance
		- CPU Utilization
		- Database Connections
		- Freeable Memory
- **Enhanced Monitoring**
	- Gathers metrics from an agent running on the RDS instance
		- OS processes
		- RDS child processes
	- Used to monitor different **processes or threads on a DB instance** (ex. percentage of the CPU bandwidth and total memory consumed by each database process in your RDS instance

## Maintenance & Upgrade
Any database engine level upgrade for an RDS DB instance with Multi-AZ deployment triggers both the primary and standby DB instances to be upgraded at the same time. This causes **downtime** until the upgrade is complete. This is why it should be done during the maintenance window.