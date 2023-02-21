---
created: 2022-05-09T11:36:16-04:00
updated: 2023-02-21T15:19:24-05:00
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Kinesis
> Kinesis Agent cannot write to a Kinesis Firehose for which the delivery stream source is already set as Kinesis Data Streams

## Kinesis Data Stream (KDS)
- Real-time data streaming service
- **Used to ingest data in real time directly from source**
- **Capacity Modes**
	- Provisioned
		- Publishing: 1MB/sec per shard or 1000 msg/sec per shard
		- Consuming: 
			- 2MB/sec per shard (throughput shared between all consumers)
			- **Enhanced Fanout**: 2MB/sec per shard per consumer (dedicated throughput for each consumer)
		-   Throughput scales with shards (**manual scaling**)
		-   Pay per shard provisioned per hour
	 - On-demand
		 - No need to provision or manage the capacity
		-   Default capacity provisioned - 4 MB/sec or 4000 records/sec
		-   Scales automatically based on observed throughput peak during the last 30 days
		-   Pay per stream per hour & data in/out per GB
- **Not Serverless**
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
	- Buffer size (size of the batch) - 1 MB to 128MB (default 5MB)
	- Buffer interval (how long to wait for buffer to fill up) - 60s to 900s (default 300s)
	- Greater the buffer size, higher the write efficiency, longer it will take to fill the buffer
- **Can ingest data in real time directly from source**
- **Auto-scaling**
- **Serverless**
- Destinations:
    -   AWS: Redshift, S3, **OpenSearch**
    -   3rd party: Splunk, MongoDB, DataDog, NewRelic, etc.
    -   Custom HTTP endpoint
-   Pay for data going through Firehose (no provisioning)
- **Supports custom data transformation using Lambda functions**
- No replay capability (does not store data like KDS)
	![[attachments/Pasted image 20230221145737.png]]

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
- ![[attachments/Pasted image 20230221151731.png]]

## Kinesis Video Streams
- Capture, process and store video streams