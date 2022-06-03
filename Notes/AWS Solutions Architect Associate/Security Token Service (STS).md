---
created: 2022-05-11T09:38:08+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Security Token Service (STS)
- Used to grant limited and temporary access to AWS resources
- Token is valid for up to 1h

## AssumeRole
- **Allows IAM Users to assume an IAM Role**
- Steps to assume a role
	- Create an lAM Role (within your account or cross-account)
	-  [[Identity & Access Management (IAM)#Trust Policies|Trust Policy]]: define which principals should be allowed to assume this role
	-   Use STS `AssumeRole` API to retrieve temporary credentials for the IAM role
	-  STS will check with IAM whether or not the user is allowed to assume that role
	- ![[attachments/Pasted image 20220511095712.png]]
- Use cases:
	- Safety: deleting a resource first requires users to temporarily assume a role
	- **Cross-account access**: assume role in target account to perform actions there
		- ![[attachments/Pasted image 20220511095752.png]]

## AssumeRoleWithSAML
- Allow **non IAM users** logged in with SAML to assume an IAM role

## AssumeRoleWithWebldentity
- Allow **non IAM users** logged in via an identity provider (Facebook, Google, etc.) to assume an IAM role
- AWS recommends using [[Cognito]] instead