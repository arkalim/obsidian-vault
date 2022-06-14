---
created: 2022-05-11T22:28:21+05:30
updated: 2022-05-20T22:35:21+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Secrets Manager
- For storing secrets only
- **Ability to force rotation of secrets every n days** (not available in [[SSM Parameter Store|Parameter Store]])
- A **secret consists of multiple key-value pairs**
- Secrets are encrypted using [[Key Management Service (KMS)|KMS]]
- Mostly used for **[[Relational Database Service (RDS)|RDS]] authentication**
	- need to specify the username and password to access the database
	- link the secret to the database to allow for automatic rotation of database login info
- Can create custom secrets