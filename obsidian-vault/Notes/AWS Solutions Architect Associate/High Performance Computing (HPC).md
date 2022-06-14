---
created: 2022-05-13T22:12:04+05:30
updated: 2022-05-14T20:39:54+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# High Performance Computing (HPC)
- Cloud is perfect for HPC
- **Cluster placement group** for low latency inter-nodal communication
- **EC2 Enhanced Networking (SR-IOV)**
	- **Elastic Network Adapter (ENA)**
		- Supported in both Linux & **Windows**
	- **Elastic Fabric Adapter (EFA)**
	    -   Enhanced for HPC
	    -   Supported in **Linux** only
	    -   Leverages **Message Passing Interface (MPI)** standard
	    -   Bypasses the underlying Linux OS to provide low-latency networking
- **AWS Batch**
	- Used to run **single jobs that span multiple EC2 instances** (multi-node)
- **AWS Parallel Cluster**
    -   **Open-source cluster management** tool to **deploy HPC on AWS**
    -   Configure with text files
    -   Automate creation of VPC, Subnet, cluster type and instance types
    -   Ability to enable **EFA** on the cluster