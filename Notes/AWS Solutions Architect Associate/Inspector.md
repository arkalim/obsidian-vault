---
created: 2022-05-11T23:29:16+05:30
updated: 2022-05-11T23:36:48+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Inspector
-   **Detect vulnerabilities** in
    -   **EC2 instances** using **System Manager (SSM) Agent** running on EC2 instances
    -   **Amazon ECR** - Assessment of containers as they are pushed to ECR
-   Integration with **AWS Security Hub**
-   Send findings to [[EventBridge]]
-   Gives a risk score associated with all vulnerabilities for prioritization
- Detects vulnerabilities which could cause threats (detected by [[GuardDuty]])