---
created: 2022-05-11T20:57:12+05:30
updated: 2022-05-20T22:30:17+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Key Management Service (KMS)
- **Regional service (keys are bound to a region)**
- Provides encryption and decryption of data and manages keys required for it
- Encrypted secrets can be stored in the code or environment variables
- **Encrypt up to 4KB of data per call (if data > 4 KB, use envelope encryption)**
- Integrated with lAM for authorization
- Audit key usage with CloudTrail
- Need to set **IAM Policy & Key Policy** to allow a user or role to access a KMS key

## Customer Master Key (CMK)
- **Symmetric keys** (necessary for envelope encryption)
- **Must call KMS API to encrypt data**
- Two types:
	- **AWS Owned CMK** (free)
		- Default KMS key for each supported service
		- Fully managed by AWS (cannot view, rotate or delete them)
	- **Customer Owned CMK** (1$/month)
		-  **AWS Managed CMK**
			- Generated in KMS
			- Option to enable automatic yearly rotation
		- **Customer Managed CMK**
			- Generated and imported from outside
			- Must be 256-bit symmetric key
			- Not recommended
		- Deletion has a waiting period (**pending deletion state**) between **7 - 30 days** (default 30 days). The key can be recovered during the pending deletion state.

## Asymmetric Keys
-   Public (Encrypt) and Private Key (Decrypt) pair
-   Used for Encrypt/Decrypt, or Sign/Verify operations
-   The public key is downloadable, but you can’t access the Private Key unencrypted
-   **No need to call the KMS API to encrypt data** (data can be encrypted by the client)
-   **Not eligible for automatic rotation** (use manual rotation)
-   Use case: encryption outside of AWS by users who can’t call the KMS API

## Key Policies
- Cannot access KMS keys without a key policy
- **Default Key Policy**
    -   Created if you don’t provide a specific Key Policy
    -   Complete access to the key for the root user ⇒ any user or role can access the key (most permissible)
-   **Custom Key Policy**
    -   Define users, roles that can access the KMS key
    -   Define who can administer the key
    -   Useful for cross-account access of your KMS key

## Cross-region Encrypted Snapshot Migration
-   Copy the snapshot to another region with **re-encryption option** using a new key in the new region (keys are bound to a region)

## Cross-account Encrypted Snapshot Migration
- Attach a Key Policy to the main CMK to authorize access to an IAM role in the target account (cross-account access)
	- ![[attachments/Pasted image 20220511214328.png]]
- Share the encrypted snapshot with the new account
- In the target account, create a copy of the snapshot (decryption will use the main CMK)
- Encrypt it with a new KMS Key in your account

## Key Rotation
- **Automatic**
	-   Supported only in Customer-owned CMK
	-   Automatic yearly key rotation
	-   Previous key is kept active (to decrypt old data)
	-   **New key has the same CMK ID** (only the backing key is changed)
	- Diagram
		- ![[attachments/Pasted image 20220511215802.png]]
- **Manual**
	-   **New Key has a different CMK ID**
	-   Keep the previous key active to decrypt old data
	-   Use aliases as CMK id changes after rotation (to hide the key change for the application). After rotation, use **UpdateAlias** API to point the alias to the new key.
	- **Good for asymmetric keys** (automatic rotation not supported)
	- Diagram
		- ![[attachments/Pasted image 20220511215742.png]]