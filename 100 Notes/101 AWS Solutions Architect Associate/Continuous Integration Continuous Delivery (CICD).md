---
created: 2022-05-13T22:46:43+05:30
updated: 2022-05-17T09:55:29+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Continuous Integration Continuous Delivery (CICD)

## Continuous Integration
-   Developers push the code to a code repository often (GitHub / CodeCommit / Bitbucket)
-   A testing / build server checks the code as soon as it’s pushed (CodeBuild / Jenkins CI)
-   The developer gets feedback about the tests and checks that have passed / failed
-   Deliver faster as the code is tested automatically

## Continuous Delivery
-   Ensure that the software can be released reliably whenever needed
-   Ensures deployments happen often and are quick
-   Automated deployment using CodeDeploy, Jenkins CD, etc.

## Technology Stack for CICD
- AWS **CodeCommit** is a fully managed code repository.
-   AWS **CodeBuild** is a fully managed continuous integration (CI) service that compiles source code, runs tests, and produces software packages that are ready to deploy. It is an alternative to Jenkins.
-   AWS **CodeDeploy** is a fully managed deployment service that automates software deployments to a variety of computing services such as EC2, Fargate, Lambda, and your on-premises servers. You can define the strategy you want to execute such as in-place or blue/green deployments.
	- Used to deploy application, not infrastructure (use [[CloudFormation]] for that)
-   AWS **CodePipeline** is a fully managed continuous delivery (CD) service that helps you automate your release pipeline for fast and reliable application and infrastructure updates. It automates the build, test, and deploy phases of your release process every time there is a code change. It has direct integration with Elastic Beanstalk.
![[attachments/Pasted image 20220513225544.png]]