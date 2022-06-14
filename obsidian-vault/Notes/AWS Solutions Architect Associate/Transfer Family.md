---
created: 2022-05-09T19:35:37+05:30
updated: 2022-05-20T12:46:55+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Transfer Family
- AWS managed service to transfer files in and out of [[Simple Storage Service (S3)|S3]] or [[Elastic File System (EFS)|EFS]] using **FTP** (instead of using proprietary methods)
- Supported Protocols
    -   **FTP** (File Transfer Protocol) - unencrypted in flight
    -   **FTPS** (File Transfer Protocol over SSL) - encrypted in flight
    -   **SFTP** (Secure File Transfer Protocol) - encrypted in flight
-   Supports Multi AZ
-   Pay per provisioned endpoint per hour + fee per GB data transfers
- Clients can either connect directly to the FTP endpoint or optionally through Route 53
- Transfer Family will need permission to read or put data into S3 or EFS