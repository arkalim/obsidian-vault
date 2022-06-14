---
created: 2022-05-09T23:46:12+05:30
updated: 2022-06-03T09:19:11+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Elastic Kubernetes Service (EKS)
- Used to launch [[Concepts#Kubernetes|Kubernetes]] (**open-source**) clusters on AWS
- **Supports both EC2 and Fargate launch types**
- Inside the EKS cluster, we have **EKS nodes (EC2 instances)** and **EKS pods (tasks)** within them. We can use a private or public load balancer to access these EKS pods.![[attachments/Pasted image 20220509235639.png]]

> **CloudWatch Container Insights** can be configured to view metrics and logs for an EKS cluster in the CloudWatch console

## Use case
- If your company is already using Kubernetes on-premises or in another cloud, and wants to migrate to AWS using Kubernetes