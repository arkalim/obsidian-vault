---
created: 2022-05-10T19:47:44+05:30
updated: 2022-05-20T11:16:34+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# DynamoDB
- Serverless NoSQL DB with multi-AZ
- Distributed Database
- Not an in-memory database (uses storage devices)
- Storage auto-scaling
- **Single digit millisecond** response time at any scale
- **Maximum size of an item: 400 KB**
- Primary key (must be decided at creation) can be a single field or a pair of fields (partition key and sort key)
- Indexes allow us to query on attributes other than the Primary Key
- Supports TTL (automatically delete an item after an expiry timestamp)
- Supports **Transactions** (either write to multiple tables or write to none)

## Capacity
- **Provisioned Mode** (default)
	- Provision read & write capacity
	- Pay for the provisioned capacity
	- Auto-scaling option (eg. set RCU and WCU to 80% and the capacities will be scaled automatically based on the workload)
- **On-demand Mode**
	-  Capacity auto-scaling based on the workload
	-  Pay for what you use (more expensive)
	-  Great for unpredictable workloads

## DynamoDB Accelerator (DAX)
-   Caches the queries and scans of DynamoDB items
-   Solves read congestion (`ProvisionedThroughputExceededException`)
-   **Microseconds latency for cached data**
-   Doesn’t require application code changes
-   5 minutes TTL for cache (default)

## DynamoDB Streams
- Ordered stream of notifications of item-level modifications (create/update/delete) in a table
- Destination can be
    -   Kinesis Data Streams
    -   AWS Lambda
    -   Kinesis Client Library applications
-   Data Retention for up to 24 hours

## Global Tables
-   For low latency access in multiple-regions
-   Applications can READ and WRITE to the table in any region and the change will automatically be replicated to other tables (**active-active cross-region replication**)
-   **Must enable DynamoDB Streams as a pre-requisite**