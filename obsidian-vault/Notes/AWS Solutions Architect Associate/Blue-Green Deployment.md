---
created: 2022-05-14T12:27:46+05:30
updated: 2022-05-20T21:43:32+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Blue-Green Deployment
- Blue-green deployment is a technique to test features in the new environment without impacting the currently running version of your application
	- **Blue** - current version
	- **Green** - new version
- When you’re satisfied that the green version is working properly, you can gradually reroute the traffic from the old blue environment to the new green environment.
- Can mitigate common risks associated with deploying software, such as **downtime** and **rollback** capability.