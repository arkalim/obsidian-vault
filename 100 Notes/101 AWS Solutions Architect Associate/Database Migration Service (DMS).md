---
created: 2022-05-13T10:37:26+05:30
updated: 2022-05-13T10:39:47+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Database Migration Service (DMS)
- Migrate entire **databases** from on-premises to AWS cloud
-   The source database remains available during migration
-   Supports:
    -   **Homogeneous migration** (eg. Oracle to Oracle)
    -   **Heterogeneous migration** (eg. Microsoft SQL Server to Aurora)
	    - Need to use **Schema Conversion Tool (SCT)** to convert the DB schema from one engine to another.
-   Continuous Data Replication using **CDC (change data capture)**
- Requires **EC2 instance running the DMS software** to perform the replication tasks. If the amount of data is large, use a large instance. If multi-AZ is enabled, need multiple instances different AZs.