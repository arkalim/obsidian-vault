---
created: 2022-05-09T10:08:33+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Snow Family
- Offline data migration to [[Simple Storage Service (S3)|S3]] or [[Simple Storage Service (S3)#Storage Classes|Glacier]]
- Used when it takes a long time to transfer data over the network
- **Takes around 2 weeks to transfer the data**
- **Snowball cannot import to Glacier directly** (transfer to S3, configure a lifecycle policy to transition the data into Glacier)
- Pay per data transfer job
- Hardware devices for
	- Data Migration (between AWS & on-premise data center)
	- Edge Computing
- Need to install **OpsHub** software on your computer to manage Snow Family devices

## Devices
- **Snowcone**
	- 2 CPUs, **4GB RAM**, wired or wireless access
	- 8 TB storage
	- USB-C power using a cord or the optional battery
	- Good for space-constrained environment
	- **DataSync Agent** is preinstalled
	- Does not support **Storage Clustering**
-   **Snowball Edge**
	-  **Compute Optimized**
		-   52 vCPUs, 208 GB of RAM
		-   42 TB storage
		-   **Optional GPU** (useful for video processing or machine learning)
		- Supports **Storage Clustering**
	-   **Storage Optimized**
		- Up to 40 CPUs, 80 GB of RAM
		- 80 TB storage
		- Supports **Storage Clustering** (up to 15 nodes)
		- Transfer up to petabytes
- **Snowmobile**
	- 100 PB storage
	- Used when transferring **> 10PB**
	- Transfer up to exabytes
	- Does not support **Storage Clustering**


## Data Migration
- **Provides block storage and Amazon S3-compatible object storage**
- Usage process
	1.  Request Snowball devices from the AWS console for delivery
	2.  **Install the snowball client / AWS OpsHub on your servers**
	3.  Connect the snowball to your servers and copy files using the client
	4.  Ship back the device when you’re done (goes to the right AWS facility)
	5.  Data will be loaded into an S3 bucket
	6.  **Snowball is completely wiped**
- Devices for data migration
	- Snowcone
	- Snowball Edge - Storage Optimized
	- Snowmobile

## Edge Computing
- Process data while it’s being created on an edge location (could be anything that doesn’t have internet or access to cloud)
- Long-term deployment options for reduced cost (1 and 3 years discounted pricing)
- Devices for edge computing
	- Snowcone
	- Snowball Edge
- Can run **EC2 Instances & AWS Lambda functions locally on Snow device** (using **AWS loT Greengrass**)