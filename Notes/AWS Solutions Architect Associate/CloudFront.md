---
created: 2022-05-08T13:28:22+05:30
updated: 2022-06-03T09:19:11+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# CloudFront
- Global service
- Global Content Delivery Network (CDN)
- **Edge Locations are present outside the VPC**
- Supports HTTP/RTMP protocol (**does not support UDP protocol**)
- **Caches content at edge locations**, reducing load at the origin
- **Geo Restriction feature**
- Improves performance for both cacheable content (such as images and videos) and dynamic content (such as API acceleration and dynamic site delivery)
- To block a specific IP at the CloudFront level, deploy a [[Web Application Firewall (WAF)|WAF]] on CloudFront
- Supports **Server Name Indication (SNI)** to allow SSL traffic to multiple domains

## Origin
- **[[Simple Storage Service (S3)|S3]] Bucket**
	- For distributing static files
	- **Origin Access Identity** (OAl) allows the S3 bucket to only be accessed by CloudFront
	- Can be used as ingress to upload files to S3
- **Custom Origin** (for HTTP) - need to be publicly accessible on HTTP by public IPs of edge locations
	- EC2 Instance
	- ELB
	- S3 Website (may contain client-side script)
	- On-premise backend

> To restrict access to ELB directly when it is being used as the origin in a CloudFront distribution, create a VPC Security Group for the ELB and use AWS Lambda to automatically update the CloudFront internal service IP addresses when they change.

## Signed URL / Cookies
- Used to **make a CloudFront distribution private** (distribute to a subset of users)
- Signed URL ⇒ access to individual files
- Signed Cookies ⇒ access to multiple files
- Whenever we create a signed URL / cookie, we attach a policy specifying:
    -   URL / Cookie Expiration (TTL)
    -   **IP ranges** allowed to access the data
    -   Trusted signers (which AWS accounts can create signed URLs)

## Pricing
-   Price Class All: all regions (best performance)
-   Price Class 200: most regions (excludes the most expensive regions)
-   Price Class 100: only the least expensive regions

## Multiple Origin
- Route to different origins based on the path in the request
	- ![[attachments/Pasted image 20220508161137.png]]

## Origin Groups
- Consists of a **primary** and a **secondary** origin (can be in **different regions**)
- Automatic failover to secondary
	- ![[attachments/Pasted image 20220508161659.png]]
- Provides **region-level** [[Concepts#High Availability|High Availability]]
- Use when getting 504 (gateway timeout) Error

## Field-level Encryption
- Sensitive information sent by the user is encrypted at the edge close to user which can only be decrypted by the web server (intermediate services can't see the encrypted fields)
- **Asymmetric Encryption** (public & private key)
- Max 10 encrypted field