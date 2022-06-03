---
created: 2022-05-11T00:05:33+05:30
updated: 2022-05-20T20:40:48+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Config
- Regional service
- Can be aggregated across regions and accounts
- Record configurations changes over time
- **Evaluate compliance of resources using config rules**
- **Does not prevent non-compliant actions** from happening (no deny)
- Evaluate config rules
	- for each config change (ex. configuration of EBS volume is changed)
	- at regular time intervals (ex. every 2 hours)
-   Can make custom config rules (must be defined in Lambda functions) such as:
    -   Check if each EBS disk is of type gp2
    -   Check if each EC2 instance is t2.micro
- **Can be used along with CloudTrail** to get a timeline of changes in configuration and compliance overtime.
- **Integrates with EventBridge or SNS** to trigger notifications when AWS resources are non-compliant

## Remediation
-   Automate remediation of non-compliant resources using **SSM Automation Documents**
	- AWS-Managed Automation Documents
	- **Custom Automation Documents**
		- to invoke a Lambda function for automation
-   You can set Remediation Retries if the resource is still non-compliant after auto remediation
-   Ex. if IAM access key expires (non-compliant), trigger an auto-remediation action to revoke unused IAM user credentials.