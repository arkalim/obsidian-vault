---
created: 2022-05-08T16:23:17+05:30
updated: 2022-06-03T09:19:11+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Global Accelerator
- Global service
- **Improves availability of the application for global users**
- Leverages the private AWS network to route requests to the application (faster)
- **Supports globally distributed application endpoints**
- **Does not cache anything at the edge location**
- Endpoint could be public or private (could span multiple regions)
	- Elastic IP
	- EC2 instances
	- ALB
	- NLB
- **Endpoint Weights** and **Traffic Dials** are used in [[Blue-Green Deployment]]
- **Not affected by client's DNS caching** because the 2 anycast IPs are static (traffic dials and endpoint weights changes are effective within seconds)
- Good for 
	- non-HTTP use cases:
		- Gaming (UDP)
		- IoT (MQTT)
		- Voice over IP (VoIP)
	- HTTP use cases that require static IP addresses or fast regional failover

## Working
- **2 [[Concepts#Unicast vs Anycast IP|anycast]] public IPs (static)** are created for your application globally. Requests from clients hitting these IPs will automatically be routed to the nearest edge location. The Edge locations send the traffic to your application through the private AWS network. 
- **Traffic dials** to control the percentage of traffic that is directed to an endpoint group (an AWS region where your application is deployed)
- **Endpoint weights** to determine the proportion of traffic that is directed to endpoints in an endpoint group

## Disaster Recovery
- Global Accelerator performs **health checks** for the application
- **Failover in less than 1 minute** for unhealthy endpoints

## Security
-   Only 2 static IP need to be whitelisted by the clients
-   Can be integrated with **AWS Shield for DDoS protection**