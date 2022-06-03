---
created: 2022-05-09T21:06:16+05:30
updated: 2022-05-20T17:33:53+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Kinesis
> Kinesis Agent cannot write to a Kinesis Firehose for which the delivery stream source is already set as Kinesis Data Streams

## Kinesis Data Stream (KDS)
- Real-time data streaming service
- **Used to ingest data in real time directly from source**
- Throughput
	- Publishing: 1MB/sec per shard or 1000 msg/sec per shard
	- Consuming: 
		- 2MB/sec per shard (throughput shared between all consumers)
		- **Enhanced Fanout**: 2MB/sec per shard per consumer (dedicated throughput for each consumer)
- Throughput scales with shards (**manual scaling**)
- **Not Serverless**
- Billing per shard (provisioned)
- **Data Retention: 1 day (default) to 365 days**
- A record consists of a **partition key** (used to partition data coming from multiple publishers) and data blob (**max 1MB**)
- Records will be ordered in each shard
- Producers use SDK, Kinesis Producer Library (KPL) or **Kinesis Agent** to publish records
- Consumers use SDK or Kinesis Client Library (KCL) to consume the records
- **Once data is inserted in Kinesis, it can’t be modified or deleted (immutability)**
- Ability to reprocess (replay) data
- Diagram
	- ![[attachments/Pasted image 20220509221100.png]]

## Kinesis Data Firehose (KDF)
- Used to load streaming data into a target location
- **Writes data in batches efficiently (near real time)**
- **Can ingest data in real time directly from source**
- Greater the batch size, higher the write efficiency
- **Auto-scaling**
- **Serverless**
- Destinations:
    -   AWS: Redshift, S3, **ElasticSearch**
    -   3rd party: Splunk, MongoDB, DataDog, NewRelic, etc.
    -   Custom: send to any HTTP endpoint
-   Pay for data going through Firehose (no provisioning)
- **Supports custom data transformation using Lambda functions**
- **Max record size: 1MB**
- No replay capability
- Diagram
	- ![[attachments/Pasted image 20220509221812.png]]

## Kinesis Data Analytics (KDA)
- Perform **real-time analytics on Kinesis streams using SQL**
- Creates streams from SQL query response
- **Cannot ingest data directly from source** (ingests data from KDS or KDF)
- **Auto-scaling**
- **Serverless**
- Pay for the data processed (no provisioning)
- Use cases:
    -   Time-series analytics
    -   Real-time dashboards
    -   Real-time metrics
- Diagram
	- ![[attachments/Pasted image 20220509222350.png]]