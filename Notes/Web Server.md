---
created: 2022-09-22T21:37:50-04:00
updated: 2022-09-23T15:24:29-04:00
---
[[Pre-Requisites]]

---
# Web Server
- **Web Servers** serve the static client-side content (HTML, CSS, JS)
- **Application Servers** serve dynamic content like the backend (responsible for the business logic)
- Web Frameworks like Express, Spring and Flask make it easy to develop application to run on a web server. This application code can then be hosted on the web server using Apache Tomcat or Nginx web server. These tools run processes that listen for requests from clients on a particular port.
	- ![[attachments/Pasted image 20220923145355.png]]
- Web Servers can also host multiple applications and redirect the request based on the URL or hostname or path to the right application.
	- ![[attachments/Pasted image 20220923145825.png]]

>[!tip]- Static vs Dynamic Websites
> - Static websites host static content (HTML, CSS and images that don't change). After the site is served, there is no interaction with the web server.
> 	- Apache HTTP and Nginx are examples of static web server
> - Dynamic websites host content that changes (eg. products on Amazon). They have a backend to process payments, shipping information etc.
> 	- Apache Tomcat and uWSGI are examples of dynamic web servers or application servers

## Apache Web Server
- **Open-source HTTP web server**, developed and maintained by the Apache Foundation
- Installed by default on CentOS (only need to `yum install httpd`)
	- If you have firewall on your system, add a rule to allow HTTP traffic
	  `firewall-cmd --permanent --add-service=http`
- View logs
	- `cat /var/log/httpd/access_log` - access logs
	- `cat /var/log/httpd/error_log` - error logs
- Config file - `/etc/httpd/conf/httpd.conf`
	- `Listen` - Port or IP:Port to listen on
	- `DocumentRoot` - Directory where to place the static files
	- `ServerName` - Domain name of the website (this will require a DNS to work)

>[!tip]- Host multiple webpages on the same web server
>	 We need to create two virtual hosts, each hosting a website with a ServerName and
>	 DocumentRoot. Based on the domain name in the request, the Apache server will automatically
>	 forward the request to the right application.
>	 ![[attachments/Pasted image 20220923151916.png]]
>	 
>	 If the number of webpages grow, we can separate the config files for each website and include them in the main config file. 
>	 ![[attachments/Pasted image 20220923152612.png]]