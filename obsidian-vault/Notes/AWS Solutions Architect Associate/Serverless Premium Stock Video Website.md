---
created: 2022-05-10T21:45:31+05:30
updated: 2022-05-10T23:52:05+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Serverless Premium Stock Video Website

## Requirements
-   We sell videos online and users have to pay to buy videos
-   Each video can be bought by many different customers
-   We only want to distribute videos to users who are premium users
-   We have a database of premium users
-   Links we send to premium users should be short lived
-   Our application is global
-   We want to be fully serverless

## Architecture
- Since the user must login to view premium videos, we can use Cognito for authentication. If the user is authenticated, API gateway will send the login info to Lambda which can query the DynamoDB to check whether the authenticated user is premium or not.
- We need to use another API endpoint to get signed URL from CloudFront. The API gateway after verifying the authentication of the client using Cognito, will invoke a lambda function that will query the DB to check if the user is premium. If so, it will use SDK to generate CF pre-signed URL and return it to client. The client will use the signed URL to access paid content via CF.

![[attachments/Pasted image 20220510214413.png]]