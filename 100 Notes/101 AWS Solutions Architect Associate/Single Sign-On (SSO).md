---
created: 2022-05-11T20:41:35+05:30
updated: 2022-05-17T01:07:20+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Single Sign-On (SSO)
- **Free service**
- Integrated with AWS Organizations (login once for your org and you can access all the accounts within that org)
- **Integration with on-premise Active Directory**
- **Supports SAML 2.0**
- Centralized auditing with CloudTrail

## SAML 2.0 Federation vs SSO
- With AssumeRoleWithSAML, we need to maintain a **3rd party identity provider** login portal. This portal checks in the identity store and returns a SAML assertion that the client sends to STS for access keys.
- With AWS SSO, we don’t need to manage the login portal, it is done through the AWS SSO service.
![[attachments/Pasted image 20220511204548.png]]