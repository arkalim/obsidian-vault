---
created: 2022-05-10T20:51:02+05:30
updated: 2022-05-17T09:40:41+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Cognito
Amazon Cognito lets you add user sign-up, sign-in, and access control to your web and mobile apps quickly and easily. Amazon Cognito scales to millions of users and supports sign-in with social identity providers, such as Apple, Facebook, Google, and Amazon, and enterprise identity providers via SAML 2.0 and OpenID Connect.

## Cognito User Pools (CUP)
- **Serverless** identity provider (provides sign in functionality for app users)
- Sends back a JSON Web Token (used to verify the identity of the user)
- **MFA support**
- **Supports Federated Identities** allowing users to authenticate via third party identity provider like Facebook, Google, SAML, etc.
- Seamless integration with **API Gateway** & **ALB** for authentication

## Cognito Identity Pools (CIP)
- Provides temporary credentials (using STS) to users so they can access AWS resources
- Integrates with CUP as an identity provider
- Example use case: provide **temporary access to write to an S3 bucket** after authenticating the user via FaceBook (using CUP identity federation)
	- Can't use S3 pre-signed URL as we need to provide access to a bucket location and not an single object