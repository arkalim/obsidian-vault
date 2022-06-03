---
created: 2022-05-07T15:42:37+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Simple Storage Service (S3)
## Intro
- Global Service
- Object store (key-value pairs)
- Buckets must have a globally unique name
- **Buckets are defined at the regional level**
- Objects have a key (full path to the object):
	`s3://my_bucket/my_folder/another_folder/my_file.txt`
-   The key is composed of bucket + *prefix* + **object name**
	s3://my_bucket */my_folder/another_folder/* **my_file.txt**
-   There’s no concept of directories within buckets (just keys with very long names that contain slashes)
- **Max Object Size: 5TB**
- Durability: 99.999999999% (total 11 9's)
- **SYNC** command can be used to **copy data between buckets**, possibly in **different regions**

> - S3 delivers **strong read-after-write consistency** (if an object is overwritten and immediately read, S3 always returns the latest version of the object)
> - S3 is strongly consistent for all GET, PUT and LIST operations

## Bucket Versioning
-   Enabled at the bucket level
-   Protects against unintended deletes
-   Ability to restore to a previous version
-   Any file that is not versioned prior to enabling versioning will have version “null”
-   Suspending versioning does not delete the previous versions, just disables it for the future
-   To restore a deleted object, delete it's "delete market"

> - Versioning can only be suspended once it has been enabled.
> - Once you version-enable a bucket, it can never return to an unversioned state.

## Encryption
- Can be enabled at the bucket level or at the object level
- **Server Side Encryption (SSE)**
	- **SSE-S3**
		- Keys managed by S3
		- AES-256 encryption
		- HTTP or HTTPS can be used
		- Must set header: `"x-amz-server-side-encryption": "AES256"`
	- **SSE-KMS**
		- Keys managed by KMS
		- HTTP or HTTPS can be used
		- KMS provides control over who has access to what keys as well as audit trails
		- Must set header: `"x-amz-server-side-encryption": "aws:kms"`
	- **SSE-C**
		- Keys managed by the client
		- Client sends the key in HTTPS headers for encryption/decryption (S3 discards the key after the operation)
		- **HTTPS must be used** as key (secret) is being transferred
- **Client Side Encryption**
	- Keys managed by the client
	- Client encrypts the object before sending it to S3 and decrypts it after retrieving it from S3

> [!info]- Enforcing Encryption 
> - **Default encryption**: encrypt the files using the default encryption (specify the encryption for the file while uploading to override the default)
>- Bucket policy can be used to force a specific type of encryption on the objects uploaded to S3 

## Access Management
- **User based security**
	- IAM policies define which API calls should be allowed for a specific user
	- Preferred over bucket policy for **fine-grained access control**
- **Resource based security (Bucket Policy)**
	- Grant public access to the bucket
	- Force objects to be encrypted at upload
	- Cross-account access
	-   Object Access Control List (ACL) - applies to the objects while uploading
	-   Bucket Access Control List (ACL) - access policy that applies to the bucket

> By default, an S3 object is owned by the account that uploaded it even if the bucket is owned by another account. To get full access to the object, the object owner must explicitly grant the bucket owner access. As a bucket owner, you can create a bucket policy to require external users to grant `bucket-owner-full-control` when uploading objects so the bucket owner can have full access to the objects.

## S3 Static Websites
- Host static websites (may contain **client-side scripts**) and have them accessible on the public internet over **HTTP only** (for HTTPS, use [[CloudFront]] with S3 bucket as the origin)
- The website URL will be either of the following:
	- `<bucket-name>.s3-website-<region>.amazonaws.com`
	- `<bucket-name>.s3-website.<region>.amazonaws.com`
- If you get a `403 (Forbidden)` error, make sure the bucket policy allows public reads
- For cross-origin access to the S3 bucket, we need to enable [[Concepts#Cross-Origin Resource Sharing CORS|CORS]] on the bucket
	- ![[attachments/Pasted image 20220507175558.png]]
- To host an S3 static website on a custom domain using Route 53, the bucket name should be the same as your domain or subdomain 
  Ex. for subdomain `portal.tutorialsdojo.com`, the name of the bucket must be `portal.tutorialsdojo.com`

## MFA Delete
- MFA required to
	- permanently delete an object version
	- suspend versioning on the bucket
- **Bucket Versioning must be enabled**
- Can only be enabled or disabled by the root user

## Server Access Logging
- Most detailed way of logging access to S3 buckets (better than [[CloudTrail]])
- Does not support **Data Events** & **Log File Validation** (use [[CloudTrail]] for that)
- Store S3 access logs into another bucket
- Logging bucket should not be the same as monitored bucket (logging loop)

## Replication
- **Asynchronous replication**
- Objects are replicated with the **same version ID**
- Supports **cross-region** and **cross-account** replication
- **Versioning must be enabled for source and destination buckets**
- For DELETE operations:
    - Replicate delete markers from source to target (optional)
    - Permanent deletes are not replicated
- There is **no chaining of replication**. So, if bucket 1 has replication into bucket 2, which has replication into bucket 3. Then objects created in bucket 1 are not replicated to bucket 3.

## Pre-signed URL
- Pre-signed URLs for S3 have temporary access token as query string parameters which allow anyone with the URL to temporarily access the resource before the URL expires (default 1h)
- Pre-signed URLs inherit the permission of the user who generated it
- Uses:
	- Allow only logged-in users to download a premium video
	- Allow users to upload files to a precise location in the bucket

## Storage Classes
- Data can be transitioned between storage classes manually or automatically using lifecycle rules
- Data can be put directly into any storage class
- **Standard**
	- **99.99% availability**
	- Most expensive
	- Instant retrieval
	- No cost on retrieval (only storage cost)
	- For frequently accessed data
- **Infrequent Access**
	- For data that is infrequently accessed, but requires rapid access when needed
	- Lower storage cost than Standard but **cost on retrieval**
	- Can **move data into IA from Standard only after 30 days**
	- Two types:
		- **Standard IA**
		    -   **99.9% Availability**
		-   **One-Zone IA**
		    -   **99.5% Availability**
			-   Data is lost if AZ fails
			-   Storage for infrequently accessed data that can be easily recreated
- **Glacier**
	- For data archival
	- Cost for storage and retrieval
	- **Can move data into Glacier from Standard anytime**
	- Objects cannot be directly accessed, they first need to be restored which could take some time (depending on the tier) to fetch the object.
	- **Default encryption for data at rest and in-transit**
	- Three types:
		- **Glacier Instant Retrieval**
			- **99.9% availability**
		    -   Millisecond retrieval
		    -   Minimum storage duration of **90 days**
		    -   Great for data accessed once a quarter
		-   **Glacier Flexible Retrieval**
			- **99.99% availability**
		    -   3 retrieval flexibility (decreasing order of cost):
		        -   Expedited (1 to 5 minutes)
			        - Can **provision retrieval capacity** for reliability
			        - Without provisioned capacity expedited retrievals might be rejected in situations of high demand
		        -   Standard (3 to 5 hours)
		        -   Bulk (5 to 12 hours)
		    -   Minimum storage duration of **90 days**
		-   **Glacier Deep Archive**
			- **99.99% availability**
		    -   2 flexible retrieval:
		        -   Standard (12 hours)
		        -   Bulk (48 hours)
		    -   Minimum storage duration of **180 days**
		    -   Lowest cost
- **Intelligent Tiering**
	- **99.9% availability**
	- Moves objects automatically between Access Tiers based on usage
	-   Small monthly monitoring and auto-tiering fee
	-   **No retrieval charges**
- #### Moving between Storage Classes
	- In the diagram below, transition can only happen in the downward direction
	- ![[attachments/Pasted image 20220514201314.png]]

## Lifecycle Rules
- Used to automate transition or expiration actions on S3 objects
- **Transition Action** (transitioned to another storage class)
- **Expiration Action** (delete objects after some time)
	-   delete a version of an object
	-   delete incomplete multi-part uploads
-   Lifecycle Rules can be created for a prefix (ex `s3://mybucket/mp3/*`) or objects tags (ex Department: Finance)

> - When you apply a retention period to an object version explicitly, you specify a `Retain Until Date` for the object version
> - When you use bucket default settings, you don't specify a `Retain Until Date`. Instead, you specify a duration, for which every object version placed in the bucket should be protected.
> - Different versions of a single object can have different retention modes and periods

## S3 Analytics
- Provides analytics to determine when to transition data into different storage classes
- **Does not work for ONEZONE_IA & GLACIER**

## Performance
- 3,500 PUT/COPY/POST/DELETE and 5,500 GET/HEAD requests per second per prefix
- Recommended to spread data across prefixes for maximum performance
- SSE-KMS may create bottleneck in S3 performance
- Performance Optimizations
	- **Multi-part Upload**
		- parallelizes upload
		- **recommended for files > 100MB**
		- **must use for files > 5GB**
	- **Byte-range fetches**
		- Parallelize download requests by fetching specific byte ranges in each request
		- Better resilience in case of failures since we only need to refetch the failed byte range and not the whole file
	- **S3 Transfer Acceleration**
		- Speed up **upload and download** for **large objects (>1GB)** for **global users** 
		- Data is ingested at the nearest edge location and is transferred over AWS private network (uses [[CloudFront]] internally)

## S3 Select
- Select a subset of data from S3 using **SQL queries** (**server-side filtering**)
- Less network cost
- Less CPU cost on the client-side

## Data Transfer Costs
- Uploads to S3 are free
- Downloads from S3 are paid
- Using S3 Transfer Acceleration, you pay only for transfers that are accelerated
- Since buckets are defined within a region, **data transfer within a region is free**

## S3 Notification Events
- Optional
- Generates events for operations performed on the bucket or objects
- Object name filtering using prefix and suffix matching
- Targets
    -   SNS topics
    -   **SQS Standard** queues (not FIFO queues)
    -   Lambda functions

## Requester Pays Buckets
- Requester pays the cost of the request and the data downloaded from the bucket. The bucket owner only pays for the storage.
- Used to share large datasets with other AWS accounts
- The requester must be authenticated in AWS (cannot be anonymous)

## Object Lock
- WORM (Write Once Read Many) model
- Block an object version modification or deletion for a specified amount of time
- Modes:
	-   **Governance mode**
		- Only users with special permissions can overwrite or delete the object version or alter its lock settings
	-   **Compliance mode**
	    - A protected object version cannot be overwritten or deleted by any user, including the root user
	    - The object's retention mode can’t be changed, and the retention period can’t be shortened

#### Glacier Vault Lock
- WORM (Write Once Read Many) model for Glacier
- For compliance and data retention