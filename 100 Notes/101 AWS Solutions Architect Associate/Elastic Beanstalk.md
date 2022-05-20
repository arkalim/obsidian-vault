---
created: 2022-05-07T15:34:27+05:30
updated: 2022-05-20T21:30:39+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Elastic Beanstalk
- Used to **deploy applications** on AWS infrastructure
- **Platform as a Service (PaaS)**
- Automatically handles capacity provisioning, load balancing, scaling, application health monitoring, instance configuration, etc. but **we have full control over the configuration**
- **Free** (pay for the underlying resources)
- Supports versioning of application code
- Can create multiple environment (dev, test, prod)
- Supports the deployment of web applications from **Docker** containers and automatically handles load balancing, auto-scaling, monitoring, and placing containers across the cluster.

## Web & Worker Environments
- Web Environment (Web Server Tier): clients requests are directly handled by EC2 instances through a load balancer.
- Worker Environment (Worker Tier): clients’s requests are put in a SQS queue and the EC2 instances will pull the messages to process them. Scaling depends on the number of SQS messages in the queue.
![[attachments/Pasted image 20220507153757.png]]