---
created: 2022-05-11T22:50:21+05:30
updated: 2022-06-03T09:19:12+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Web Application Firewall (WAF)
- Protects your application from common **layer 7 web exploits** such as **SQL Injection** and **Cross-Site Scripting (XSS)**
- Layer 7 has more data about the structure of the incoming request than layer 4 (used by [[AWS Shield]])
- Can only be deployed on
    -   [[Elastic Load Balancer (ELB)#Application Load Balancer ALB|Application Load Balancer]]
    -   [[API Gateway]]
    -   [[CloudFront]]
- WAF contains **Web ACL (Access Control List)** containing rules to **filter requests** based on:
	-   **IP addresses**
	-   HTTP headers
	-   HTTP body
	-   URI strings
	-   Size constraints (ex. max 5kb)
	-   **Geo-match** (block countries)
	-   **Rate-based rules** (to count occurrences of events per IP) for **DDoS protection**