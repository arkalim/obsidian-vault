---
created: 2022-05-11T23:22:50+05:30
updated: 2022-05-11T23:25:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# GuardDuty
- Intelligent **threat discovery** using ML to protect AWS account
- No management required (just enable)
- Monitors:
    -   **CloudTrail Logs** (unusual API calls, unauthorized deployments)
    -   **VPC Flow Logs** (unusual internal traffic, unusual IP address)
    -   **DNS Logs** (compromised EC2 instances sending encoded data within DNS queries)
    -   **EKS Audit Logs** (suspicious activities and potential EKS cluster compromises)
- Setup CloudWatch Event rules to target AWS Lambda or SNS for automation

![[attachments/Pasted image 20220511232409.png]]