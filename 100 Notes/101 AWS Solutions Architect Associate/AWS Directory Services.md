---
created: 2022-05-11T19:58:24+05:30
updated: 2022-05-11T19:58:24+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# AWS Directory Services
- Used to extend the AD network by involving services like EC2 to be a part of the AD to share login credentials.

## AWS Managed Microsoft AD
-   Login credentials are shared between on-premise and AWS managed AD
-   **Manage users on both AD (on-premise and on AWS managed AD)**
-   Supports MFA
-   Establish trust connections with your on premise AD

## AD Connector
-   AD connector will proxy all the requests to the on-premise AD
-   **Users are managed on the on-premise AD only**
-   Supports 

## Simple AD
-   AD-compatible managed directory on AWS (**cannot be joined with on-premise AD**)
-   **Users are managed on the AWS AD only**
-   Use when you don’t have an on-premise AD