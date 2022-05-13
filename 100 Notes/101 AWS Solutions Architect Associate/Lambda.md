---
created: 2022-05-10T19:23:46+05:30
updated: 2022-05-10T23:45:51+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Lambda
- Function as a  Service (FaaS)
- Serverless
- Auto-scaling
- Pay per request (number of invocations) and compute time
- Integrated with CloudWatch for monitoring
- **Not good for running containerized applications**

## Performance
- Increasing RAM will improve CPU and network
- RAM: 128 MB - 10GB
- **Max execution time: 15 mins**
- Disk capacity in function container (`/tmp`): 512 MB
- Environment variables: 4 KB
- Deployment size
	- Compressed: 50MB
	- Uncompressed: 250 MB

## Supported Languages
-   Node.js (JavaScript)
-   Python
-   Java
-   C#
-   Golang
-   Ruby
-   Any other language using Custom Runtime API (community supported, example Rust)

## Use cases
- Serverless thumbnail creation using S3 & Lambda
- Serverless CRON job using EventBridge & Lambda

## Lambda@Edge
-   Deploy Lambda functions alongside your [[CloudFront]] CDN for computing at edge locations
-   Customize the CDN content using Lambda at the edge location (responsive)
-   No server management (Lambda is deployed globally)
-   Pay for what you use (no provisioning)
-   Can be used to modify CloudFront requests & responses
	- ![[attachments/Pasted image 20220510194136.png]]
- We can create a global application using Lambda@Edge where S3 hosts a static website which uses client side JS to send requests to CF which will process the request in a lambda function in that edge location to perform some operation like fetching data from DynamoDB.
	- ![[attachments/Pasted image 20220510194430.png]]