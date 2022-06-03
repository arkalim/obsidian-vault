---
created: 2022-05-09T22:44:23+05:30
updated: 2022-05-20T21:12:59+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Elastic Container Service (ECS)
- Used to launch Docker containers on AWS
- Integrates with ALB for load balancing to ECS tasks
- [[Elastic File System (EFS)|EFS]] is used as persistent multi-AZ shared storage for ECS tasks

## Launch Types
#### EC2 Launch Type
- **Not Serverless**
- Containers run on underlying EC2 instances
- ECS takes care of launching & stopping containers (ECS tasks)
- You must provision & maintain EC2 instances (use ASG)
- Inside a VPC spanning multiple AZ, there is an ECS cluster spanning multiple AZ. Inside the ECS cluster, there will be an ASG responsible for launching container instances (EC2). On every EC2 instance, ECS agent will be running (happens automatically if you choose the AMI for ECS when launching the instance) which registers these instances to the ECS cluster. This will allow the ECS cluster to run Docker containers (ECS tasks) on these instances.
	- ![[attachments/Pasted image 20220509230845.png]]

#### Fargate Launch Type
- **Serverless**
- No need to provision infrastructure
- No need to worry about infrastructure scaling
- ECS launches the required containers based on the CPU / RAM needed (**we won’t know where these containers are running**)
- VPC and ECS cluster are setup the same way as in EC2 launch type, but instead of using [[Auto Scaling Group (ASG)|ASG]] with EC2 instances, we have a Fargate cluster spanning multiple AZ. The Fargate cluster will run ECS tasks anywhere within the cluster and attach an ENI (private IP) to each task. So, if we have a lot of ECS tasks, **we need sufficient free private IPs**.
	- ![[attachments/Pasted image 20220509231345.png]]

## IAM Roles for ECS Tasks
-  **EC2 Instance Profile** (IAM role for the EC2 instance)
    -   Used by the ECS agent to:
        -   Make API calls to ECS service
        -   Send container logs to Cloud Watch
        -   Pull Docker image from ECR
- **Task Execution Role**
	- Allows ECS tasks to access AWS resources
	- Each task can have a separate role
	- **Use different roles for the different ECS Services**
	- Task Role is defined in the task definition
	- Use `taskRoleArn` parameter to assign IAM policies to ECS Task Execution Role
	- Ex. Reference sensitive data in **Secrets Manager** or **SSM Parameter Store**

## ECS Services
- An ECS Service is a collection of ECS tasks that perform the same function
- We can use ALB to send requests to these tasks
- **Service CPU Usage** or the **SQS queue length** for a service are used for scaling
- Diagram
	- ![[attachments/Pasted image 20220509232531.png]]

## Load Balancing
- **EC2 Launch Type**
	- **Dynamic port is assigned randomly to ECS tasks**
	- Once the ALB is registered to a service in the ECS cluster, it will find the right port on the EC2 Instances
	- You **must allow on the EC2 instance’s security group any port from the ALB security group** because it may attach on any port
	- Diagram
		- ![[attachments/Pasted image 20220509232914.png]]
- **Fargate Launch Type**
	- **Each task has a unique IP but same port (80)**
	-   You **must allow on the ENI’s security group the task port (80) from the ALB security group**
	- Diagram
		- ![[attachments/Pasted image 20220509233226.png]]

## Rolling Updates
-   **Minimum healthy percentage** - determines how many tasks, running the current version, we can terminate while staying above the threshold
-   **Maximum percentage** - determines how many new tasks, running the new version, we can launch while staying below the threshold
- Min: 50% and Max: 100% and starting number of tasks 4
	- ![[attachments/Pasted image 20220509234001.png]]
- Min: 100% and Max: 150% and starting number of tasks 4
	- ![[attachments/Pasted image 20220509234016.png]]

## Secrets in ECS tasks
- Store the secrets in [[Secrets Manager]] or [[SSM Parameter Store|Parameter Store]] and encrypt them using KMS
- Reference the secrets in container definition with the name of the environment variable
- Create an **ECS task execution role** and reference it with your task definition, which allows access to both KMS and the Parameter Store/Secrets Manager.
- Supported for both EC2 and Fargate launch types

## Scaling ECS Tasks using EventBridge
- You can use EventBridge (CloudWatch Events) to run Amazon ECS tasks when certain AWS events occur. 
- Ex: set up a CloudWatch Events rule that runs an Amazon ECS task whenever a file is uploaded to an S3 bucket. You can also declare a reduced number of ECS tasks whenever a file is deleted from the S3 bucket.

## Troubleshooting Steps
-   Verify that the Docker daemon is running on the container instance.
-   Verify that the Docker Container daemon is running on the container instance.
-   Verify that the container agent is running on the container instance.
-   Verify that the IAM instance profile has the necessary permissions.