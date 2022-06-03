---
created: 2022-05-11T22:00:46+05:30
updated: 2022-05-11T22:27:33+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# SSM Parameter Store
- Serverless
- Used to store parameters & secrets
- Parameter versioning
- Seamless Encryption with KMS for encryption and decryption of stored secrets
- Parameters are stored in hierarchical fashion

## Tiers
|                      | Standard Tier | Advanced Tier |
| -------------------- | ------------- | ------------- |
| Number of parameters | 10,000        | 100,000       |
| Max parameter size   | 4KB           | 8KB           |
| Parameter Policy     | Not supported | Supported     |
| Cost                 | Free          | Paid          |

## Parameter Policies
- Only supported in advanced tier
- Assign policies to a parameter for additional features
	- Expire the parameter after some time (TTL)
	- Parameter expiration notification
	- Parameter change notification