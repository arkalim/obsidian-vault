---
created: 2022-05-13T10:37:26+05:30
updated: 2022-05-20T12:34:44+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Database Migration Service (DMS)
- Migrate entire **databases** from on-premises to AWS cloud
-   The source database remains available during migration
- **Continuous Data Replication** using **CDC (change data capture)**
- Requires **EC2 instance running the DMS software** to perform the replication tasks. If the amount of data is large, use a large instance. If multi-AZ is enabled, need an instance in each AZ.

> Most resource-efficient way with least development and no management, to continuously replicate data to [[Redshift]] for analytics (first moves data to an S3 bucket and then to Redshift)

> DMS supports S3 as the source and **Kinesis** as the target, so data stored in an S3 bucket can be streamed to Kinesis. This also supports CDC to stream new data that is put in the S3 bucket.

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

## Migrating using [[Snow Family]]
1.  Use the Schema Conversion Tool (SCT) to extract the data locally and move it to the Edge device
2. Ship the Edge device or devices back to AWS
3. After AWS receives your shipment, the Edge device automatically loads its data into an Amazon S3 bucket.
4. AWS DMS takes the files and migrates the data to the target data store (eg. DynamoDB)