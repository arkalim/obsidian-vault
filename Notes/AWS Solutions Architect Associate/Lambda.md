---
created: 2022-05-10T19:23:46+05:30
updated: 2022-06-03T09:19:11+05:30
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
- Can package and deploy Lambda functions as container images

## Performance
- Increasing RAM will improve CPU and network
- RAM: 128 MB - 10GB
- **Max execution time: 15 mins**
- Disk capacity in function container (`/tmp`): 512 MB
- Environment variables: 4 KB

## Deployment
- Deployment size
	- Compressed: 50MB
	- Uncompressed: 250 MB
- If you intend to reuse code in more than one Lambda function, consider creating a **Lambda Layer** (a ZIP archive that contains libraries) for the reusable code. With layers, you can **use libraries in your function without including them in the deployment package**. Layers let you keep your deployment package small, which makes development easier. A function can use up to 5 layers at a time.

## Networking
- By default, **Lambda functions operate from an AWS-owned VPC** and hence have **access to any public internet** or **public AWS API** (ex. lambda functions can interact with AWS DynamoDB APIs to PutItem)
- Once a Lambda function is **VPC-enabled**, all network traffic from your function is subject to the routing rules of your VPC/Subnet. If your function needs to interact with a public resource, it will need a [[Virtual Private Cloud (VPC)#NAT Gateway|NAT Gateway]]. You should only enable your functions for VPC access when you need to interact with a private resource located in a private subnet (ex. RDS database)

> To enable your Lambda function to access resources inside your private VPC, you must provide **VPC subnet IDs** and **Security Group IDs**. AWS Lambda uses this information to set up ENIs.

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