---
created: 2022-05-05T21:28:07+05:30
updated: 2022-05-14T21:10:14+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---

# IAM
- Global Service (IAM entities like roles can be used in any region without recreation)

## Users & Groups
- Groups cannot be nested
- User can belong to multiple groups
- User doesn't have to belong to a group
- **Root User** has full access to the account 
- **IAM User** has limited permission to the account
- You should log in as an IAM user with **admin access** even if you have root access. This is just to be sure that nothing goes wrong by accident.
- A new IAM user created using the AWS CLI or AWS API has no AWS credentials
## Policies
- Policies are JSON documents that outline permissions for users, groups or roles
- Two types
	- **User based policies**:  IAM policies define which API calls should be allowed for a specific user
	- **Resource based policies**: control access to an AWS resource
- An IAM principal can access a resource if the user policy ALLOWS it OR the resource policy ALLOWS it AND there’s no explicit DENY. 
- Policies assigned to a user are called inline policies
- Follow **least privilege principle** for IAM Policies
- Policy Structure
	- ![[attachments/Pasted image 20220505202904.png]]

## Protect IAM Accounts
- **Password Policy**
	- Used to enforce standards for password
		- password rotation
		- password reuse
	- Prevents **brute force** attack
- **Multi Factor Authentication (MFA)**
	- Both root user and IAM users should use MFA

## Roles
- Collection of policies for AWS services

## Reporting Tools
- **Credentials Report**
	- lists all the users and the status of their credentials (MFA, password rotation, etc.)
	- **account level** - used to audit security for all the users
- **Access Advisor**
	- shows the service permissions granted to a user and when those services were last accessed
	- **user-level**
	- used to revise policies for a specific user

## Access Keys
- Need to use access keys for AWS CLI and SDK
- Don't share access keys with anyone (every user can generate their own access keys)
- Access keys are only shown once and if you lose them you need to generate a new access key
- Access Key ID ~ username
- Secret Access Key ~ password

## Guidelines
- Use root account only for account setup
- 1 physical user = 1 IAM user
- Enforce MFA for both root and IAM users
- Never share lAM credentials & Access Keys

## Policy Simulator
- Online tool that allows us to check what API calls an IAM User, Group or Role is allowed to perform based on the permissions they have.

## Permission Boundaries
- Set the maximum permissions an IAM entity can get
- **Can be applied to users and roles (not groups)**
- Used to ensure some users can’t escalate their privileges (make themselves admin)

## Assume Role vs Resource-based Policy
- When you assume an IAM Role, you give up your original permissions and take the permissions assigned to the role
- When using a resource based policy, the principal doesn’t have to give up their permissions