---
created: 2022-05-08T16:23:17+05:30
updated: 2022-05-10T23:49:29+05:30
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
- **Client doesn't cache anything** because the 2 anycast IPs are static
- Good for 
	- non-HTTP use cases:
		- Gaming (UDP)
		- IoT (MQTT)
		- Voice over IP (VoIP)
	- HTTP use cases that require static IP addresses or fast regional failover

## Working
- 2 [[Concepts#Unicast vs Anycast IP|anycast]] public IPs (static) are created for your application globally. Requests from clients hitting these IPs will automatically be routed to the nearest edge location. The Edge locations send the traffic to your application through the private AWS network. 

## Disaster Recovery
- Global Accelerator performs health checks for the application
- **Failover in less than 1 minute** for unhealthy endpoints

## Security
-   Only 2 static IP need to be whitelisted by the clients
-   Can be integrated with **AWS Shield for DDoS protection**