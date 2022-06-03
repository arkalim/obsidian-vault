---
created: 2022-05-11T20:41:35+05:30
updated: 2022-05-20T19:28:39+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# AWS Single Sign-On (SSO)
- **Free service**
- **Integrated with AWS Organizations** (login once for your org and you can access all the accounts within that org)
- **Integration with on-premise Active Directory**
- **Supports SAML 2.0**
- Centralized auditing with CloudTrail

## Federated SSO vs AWS SSO
- With Federated SSO, we need to maintain a **3rd party identity provider** (AD/ADFS, CUP, Google, Facebook, custom identity broker) login portal. The IDP returns the JWT or SAML Assertion which the client needs to exchange with STS for login credentials. 
- With AWS SSO, we don’t need to manage the login portal, it is done through the AWS SSO. It returns the credentials directly.
![[attachments/Pasted image 20220511204548.png]]