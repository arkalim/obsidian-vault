---
created: 2022-05-07T23:22:27+05:30
updated: 2022-05-20T21:48:29+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Athena
- **Serverless** query service to perform analytics on [[Simple Storage Service (S3)|S3]]
- Uses **SQL** language to query the files
- **Runs directly on S3** (no copying needed)
- Output stored in S3
- Built on **Presto** engine
- Supports CSV, JSON, ORC, AVI and Parquet file formats

> **Use compressed or columnar data for cost-savings** (due to less scan)

> Can be used along with **AWS Transcribe** (automatic speech recognition service that converts audio to text) to analyze audio for sentiment analysis.