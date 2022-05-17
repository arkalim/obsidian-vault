---
created: 2022-05-14T18:11:43+05:30
updated: 2022-05-17T10:35:01+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]
[[Elastic Compute Cloud (EC2)]]

---
# Instance Store
- **Hardware storage directly attached to EC2 instance**
- **Highest IOPS** of any available storage (millions of IOPS)
- **Ephemeral storage** (loses data when the instance is stopped or terminted)
- Good for buffer / cache / scratch data / temporary content

> You can specify the instance store volumes only when you launch an instance. You can’t attach instance store volumes to an instance after you’ve launched it.

## RAID
- **RAID 0**
	- Improve performance of a storage volume by distributing reads & writes in a stripe across attached volumes
	- If you add a storage volume, you get the straight addition of throughput and IOPS
	- For high performance applications
- **RAID 1**
	- Improve data availability by mirroring data in multiple volumes
	- For critical applications