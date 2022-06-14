---
created: 2022-05-11T20:02:59+05:30
updated: 2022-05-20T19:18:40+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# AWS Organizations
- **Global service**
- Manage multiple AWS accounts under an organization
	- 1 master account
	- member accounts
- An AWS account can only be part of one organization
- **Consolidated Billing** across all accounts (lower cost)
- Pricing benefits from aggregated usage of AWS resources
- API to automate AWS account creation (on demand account creation)
- Establish Cross Account Roles for Admin purposes where the master account can assume an admin role in any of the children accounts

> Organization API can only create member accounts. They cannot configure anything within those accounts (use [[CloudFormation]] for that).

## Organizational Units (OU)
- Folders for grouping AWS accounts of an organization
- Can be nested
	- ![[attachments/Pasted image 20220511200502.png]]

## Service Control Policies (SCP)
- **Whitelist or blacklist IAM actions at the OU or Account level**
- **Does not apply to the Master Account**
- Applies to all the Users and Roles of the member accounts, including the root user. So, if something is restricted for that account, even the root user of that account won’t be able to do it.
- Must have an explicit allow (**does not allow anything by default**)
- **Does not apply to service-linked roles**
- **Explicit Deny** has the highest precedence

## Migrating Accounts between Organizations
-   To migrate member accounts from one organization to another
    1.  Remove the member account from the old organization
    2.  Send an invite to the member account from the new organization
    3.  Accept the invite from the member account
-   To migrate the master account
    1.  Remove the member accounts from the organizations using procedure above
    2.  Delete the old organization
    3.  Repeat the process above to invite the old master account to the new org