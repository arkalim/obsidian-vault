---
created: 2022-05-07T11:11:37+05:30
updated: 2022-05-20T10:26:03+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---

# ElastiCache
- Regional Service
- AWS managed caching service
- **In-memory key-value store** with **sub-millisecond latency**
- Need to provision an underlying EC2 instance
- **Makes the application stateless** because it doesn’t have to cache locally
- **Using ElastiCache requires heavy application code changes** (setup the application to query the cache before and after querying the database)
- Usage:
	- **DB Cache** (lazy loading): cache read operations on a database (reduced latency)
	- **Session Store**: store user's session data like cart info (allows the application to remain stateless)
	- **Global Data Store**: store intermediate computation results

## Redis vs Memcached
| Redis                                                          | Memcached                                            |
| -------------------------------------------------------------- | ---------------------------------------------------- |
| In-memory data store                                           | **Distributed** memory object cache                      |
| Read Replicas (for scaling reads & HA)                         | No replication                                       |
| Backup & restore                                               | No backup & restore                                  |
| **Single-threaded**                                            | **Multi-threaded**                                   |
| **HIPAA compliant**                                            | **Not HIPAA compliant**                              |
| Data is stored in an in-memory DB which is replicated          | Data is partitioned across multiple nodes (sharding) |
| **Redis Sorted Sets** are used in realtime Gaming Leaderboards |                                                      |
| Good for auto-completion                                       |                                                      |
| Multi-AZ support with automatic failover (disaster recovery)                                                               |                                                      |

## Security & Access Management
- Network security is managed using **Security Groups** (only allow EC2 security group for incoming requests)
- At rest encryption using KMS
- In-flight encryption using SSL
- Use **Redis Auth** to authenticate to ElastiCache for Redis
- Memcached supports SASL-based authentication