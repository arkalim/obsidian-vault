---
created: 2022-05-11T10:08:07+05:30
updated: 2022-05-16T22:29:57+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Identity Federation in AWS
- Federation lets **users outside of AWS to assume temporary role** for accessing AWS resources using a **third-party identity provider**
- **Need to configure IAM roles** with the required policies that users will assume
- No need to create lAM users (user management by the third-party identity provider)
- Need to setup a trust between identity provider and IAM
- Flavors
	-   SAML 2.0
	-   Custom Identity Broker
	-   Web Identity Federation with Amazon Cognito
	-   Web Identity Federation without Amazon Cognito (not recommended)
	-   Single Sign On
	-   Non-SAML with AWS Microsoft AD
- Diagram
	- ![[attachments/Pasted image 20220511103332.png]]

## SAML 2.0 Federation
- Used to integrate **Active Directory / ADFS** with AWS using SAML compatible IDP
- **Client exchanges SAML assertion for security credentials from STS** using the STS **AssumeRoleWithSAML** API
- **SAML 2.0 Federation is the old way**, [[Single Sign-On (SSO)]] Federation is the new way
- Flow diagram
	- ![[attachments/Pasted image 20220511103954.png]]

## Custom Identity Broker Federation
- Use only if identity provider is not compatible with SAML 2.0
- **Identity broker gets security credentials from STS** using the STS **AssumeRole** or **GetFederationToken** API
- The identity broker must determine the appropriate lAM policy
- Flow diagram
	- ![[attachments/Pasted image 20220511122254.png]]



## Web Identity Federation with Cognito
- Use for **OpenID Connect (OIDC) compatible IDP** like CUP, FaceBook, Google etc.
- Example: provide temporary access to write to S3 bucket using Facebook Login
- Steps
    -   Log in to federated identity provider or remain anonymous
    -   Use the token to authenticate to Federated Identity Pool
    -   Get temporary AWS credentials back from the Federated Identity Pool
- Flow diagram
	- ![[attachments/Pasted image 20220511124149.png]]