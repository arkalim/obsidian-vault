---
created: 2022-05-14T11:06:15+05:30
updated: 2022-05-20T21:55:57+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Glue
- **Serverless** Extract, Transform & Load (ETL) service
- Used to prepare & transform data for **analytics**
	- ![[attachments/Pasted image 20220514111221.png]]
	- 
- Used to get data from a store, process and put it in another store (could be the same store)

> Glue ETL job can write the transformed data using a compressed file format to save storage cost

> Using Glue involves **significant development efforts** to write custom migration scripts to copy the database data into the target database.

## Glue Data Catalog
- **Glue Data Crawlers** crawl databases and collect metadata which is populated in **Glue Data Catalog**
- Metadata can be used for analytics