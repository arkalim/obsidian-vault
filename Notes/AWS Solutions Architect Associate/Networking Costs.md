---
created: 2022-05-13T10:08:31+05:30
updated: 2022-05-13T10:19:32+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Networking Costs

## Inter-AZ and Inter-Region Networking
- Traffic entering the AWS is free
- Use Private IP instead of Public IP for good savings and better network performance
- Traffic leaving an AWS region is paid
- Use same AZ for maximum savings (at the cost of availability)
![[attachments/Pasted image 20220513100858.png]]

## Minimizing Egress Traffic
- Try to keep as much internet traffic within AWS to minimize costs
- Direct Connect location that are co-located in the same AWS Region result in lower cost for egress network
![[attachments/Pasted image 20220513101339.png]]

## S3 Data Transfer
-   S3 ingress (uploading to S3): free
-   S3 to Internet: $0.09 per GB
-   S3 Transfer Acceleration:
    -   Additional cost on top of Data Transfer (+$0.04 to $0.08 per GB)
-   S3 to CloudFront: free (internal network)
-   CloudFront to Internet: $0.085 per GB (slightly cheaper than S3)
    -   Caching capability (lower latency)
    -   Reduced costs of S3 Requests (cheaper than just S3)
-   S3 Cross Region Replication: $0.02 per GB
![[attachments/Pasted image 20220513101700.png]]