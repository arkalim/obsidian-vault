---
created: 2022-05-14T00:18:36+05:30
updated: 2022-05-20T11:38:43+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Redshift
- AWS managed **data warehouse** (10x better performance than other data warehouses)
- Based on **PostgreSQL**
- Used for **Online Analytical Processing (OLAP)** and high performance querying
- **Columnar storage** of data with **massively parallel query execution** in **SQL**
- Faster querying than [[Athena]] due to indexes
- Can be used for both long complex queries as well as short fast queries
- Need to provision instances as a part of the Redshift cluster (pay for the instances provisioned)
- Integrated with **Business Intelligence (BI) tools** such as **QuickSight** or **Tableau**
- Redshift Cluster can have **1 to 128 nodes (128TB per node)**
	- **Leader Node**: query planning & result aggregation
	- **Compute Nodes**: execute queries & send the result to leader node
- **No multi-AZ support** (all the nodes will be in the same AZ)
- Auto-healing feature

## Loading data into Redshift
- **S3**
	- Use **COPY command** to load data from an S3 bucket into Redshift
	- **Without Enhanced VPC Routing**
		- data goes through the public internet
	- **Enhanced VPC Routing**
		- data goes through the VPC without traversing the public internet
- **Kinesis Data Firehose**
	- **Sends data to S3** and issues a **COPY** command to load it into Redshift
- **EC2 Instance**
	- Using **JDBC driver**
	- Used when an application needs to write data to Redshift
	- Optimal to write data in batches

## Snapshots
- Stored internally in **S3**
- **Incremental** (only changes are saved)
- Can be restored into a new Redshift cluster
- Automated
	- based on a schedule or storage size (every 5 GB)
	- set retention
- Manual
	- retains until you delete them
- Feature to **automatically copy snapshots into another region**

## Redshift Spectrum
- Query data present in S3 without loading it into Redshift
- Need to have a Redshift cluster to use this feature
- Query is executed by 1000s of Redshift Spectrum nodes
- Consumes much less of your cluster's processing capacity than other queries
- Diagram
	- ![[attachments/Pasted image 20220514110209.png]]