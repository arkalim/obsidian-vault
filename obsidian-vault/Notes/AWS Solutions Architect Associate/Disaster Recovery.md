---
created: 2022-05-13T10:34:58+05:30
updated: 2022-05-18T09:40:21+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Disaster Recovery
-   Any event that has a negative impact on a company’s business continuity or finances is a disaster
-   **Recovery Point Objective (RPO)**: how often you backup your data (determines how much data are you willing to lose in case of a disaster)
-   **Recovery Time Objective (RTO)**: how long it takes to recover from the disaster (down time)
- Diagram
	- ![[attachments/Pasted image 20220513102636.png]]

## Strategies

#### Backup & Restore
- High RPO (hours)
- Need to spin up instances and restore volumes from snapshots in case of disaster => High RTO
- Cheapest & easiest to manage

#### Pilot Light
- **Critical parts of the app are always running** in the cloud (eg. continuous replication of data to another region)
- Low RPO (minutes)
- Critical systems are already up => Low RTO
- Ideal when RPO should be in minutes and the solution should be inexpensive
- DB is critical so it is replicated continuously but EC2 instance is spin up only when a disaster strikes

#### Warm Standby
- A complete backup system is up and running at the minimum capacity. This system is quickly scaled to production capacity in case of a disaster.
- Very low RPO & RTO (minutes)
- Expensive

#### Multi-Site or Hot Site Approach
- A backup system is running at full production capacity and the request can be routed to either the main or the backup system.
- Multi-data center approach
- Lowest RPO & RTO (minutes or seconds)
- Very Expensive