---
created: 2022-05-13T23:57:32+05:30
updated: 2022-05-13T23:58:45+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Trusted Advisor
-   Service that analyzes your AWS accounts and provides **recommendations** on:
    -   **Cost Optimization**
        -   low utilization EC2 instances, EBS volumes, idle load balancers, etc.
        -   Reserved instances & savings plans optimizations
    -   **Performance**
        -   High utilization EC2 instances, CloudFront CDN optimizations
        -   EC2 to EBS throughput optimizations, Alias records recommendations
    -   **Security**:
        -   MFA enabled on Root Account, IAM key rotation, exposed Access Keys
        -   S3 Bucket Permissions for public access, security groups with unrestricted ports
    -   **Fault Tolerance**:
        -   EBS snapshots age, Availability Zone Balance
        -   ASG Multi-AZ, RDS Multi-AZ, ELB configuration, etc.
    -   **Service Limits**
        -   whether or not you are reaching the service limit for a service and suggest you to increase the limit beforehand
- **No installation needed**
- **Weekly email notifications**