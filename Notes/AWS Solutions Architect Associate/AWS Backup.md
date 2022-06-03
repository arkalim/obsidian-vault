---
created: 2022-05-13T21:58:13+05:30
updated: 2022-05-13T22:00:01+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# AWS Backup
- Centrally manage and automate backups of AWS services **across regions and accounts**
- On-Demand and Scheduled backups
- Supported services:
    -   EC2 / EBS
    -   S3
    -   RDS / Aurora / DynamoDB
    -   DocumentDB / Neptune
    -   EFS / FSx (Lustre & Windows)
    -   Storage Gateway (Volume Gateway)

## Backup Vault
-  WORM (Write Once Read Many) model for backups
- Even the root user cannot delete backups
-   Additional layer of defense to protect your backups against:
    -   Inadvertent or malicious delete operations
    -   Updates that shorten or alter retention periods