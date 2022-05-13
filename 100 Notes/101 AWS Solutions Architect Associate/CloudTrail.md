---
created: 2022-05-11T00:01:49+05:30
updated: 2022-05-11T00:29:48+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# CloudTrail
- **Global Service**
- Provides governance, compliance and audit for the AWS Account
- Enabled by default
- Records the API calls made within the AWS account
- **Event retention: 90 days**
- Export CloudTrail logs into
	- [[CloudWatch#Logs|CloudWatch Logs]]
	- [[Simple Storage Service (S3)|S3]]

## Event Types
#### Management Events
- Events of operations that modify AWS resources. Ex:
	- Creating a new IAM user
	- Deleting a subnet
- Enabled by default
- Can separate Read Events (that don’t modify resources) from Write Events (that may modify resources)

#### Data Events
- Events of operations that modify data
	- S3 object-level activity
	- Lambda function execution
- Disabled by default (due to high volume of data events)

#### Insight Events
-   Enable **CloudTrail Insights** to detect unusual activity in your account
    -   inaccurate resource provisioning
    -   hitting service limits
    -   bursts of AWS IAM actions
    -   gaps in periodic maintenance activity
-   CloudTrail Insights analyzes normal management events to create a baseline and then continuously analyzes write events to detect unusual patterns. If that happens, CloudTrail generates insight events that
    -   show anomalies in the Cloud Trail console
    -   can can be logged to S3
    -   can trigger an EventBridge event for automation