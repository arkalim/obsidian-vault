---
created: 2022-05-13T10:37:26+05:30
updated: 2022-05-14T12:06:14+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Database Migration Service (DMS)
- Migrate entire **databases** from on-premises to AWS cloud
-   The source database remains available during migration
- **Continuous Data Replication** using **CDC (change data capture)**
- Requires **EC2 instance running the DMS software** to perform the replication tasks. If the amount of data is large, use a large instance. If multi-AZ is enabled, need multiple instances different AZs.
- Most resource-efficient way with least development and no management, to continuously replicate data to [[Redshift]] for analytics (first moves data to an S3 bucket and then to Redshift)

## Types of Migration

#### Homogeneous Migration
- When the source and target DB engines are the same (eg. Oracle to Oracle)
- One step process:
	- Use the **Database Migration Service (DMS)** to migrate data from the source database to the target database

#### Heterogeneous Migration
- When the source and target DB engines are different (eg. Microsoft SQL Server to Aurora)
- Two step process:
	1. Use the **Schema Conversion Tool (SCT)** to convert the source schema and code to match that of the target database
	2. Use the **Database Migration Service (DMS)** to migrate data from the source database to the target database