---
created: 2022-05-10T21:31:50+05:30
updated: 2022-05-10T23:52:25+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Serverless ToDo List App

## Requirements
-   Expose as REST API with HTTPS
-   Serverless architecture
-   Users should be able to directly interact with their own folder in S3
-   Users should authenticate through a managed serverless service
-   Users can write and read to-dos, but they mostly read them
-   The database should scale, and have some high read throughput

## Architecture
-   Giving users access to a folder in S3
	- Cognito Identity Pool can be used to get temporary credentials after authenticating using CUP.
	- Pre-signed URL isn’t used since we need to provide access to the bucket and not an object.
-   Improving read throughputs
	- Implement a DAX layer to cache DynamoDB queries.
	- Caching can also be implemented as the API gateway level if the read responses don’t change much.

![[attachments/Pasted image 20220510213033.png]]