---
created: 2022-09-22T21:37:50-04:00
updated: 2022-10-08T19:47:08-04:00
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
- Install Apache in CentOS - `yum install httpd`)
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

## Apache Tomcat
- Provides a web server environment where we can host Java based web applications
- Installing Apache Tomcat on CentOS
	- ![[attachments/Pasted image 20220923170352.png]]
- Inside the `apache-tomcat-<version>` directory, there are multiple directories
	- `bin` - contains scripts to control the web server
	- `conf` - contains configuration files for the web server
	- `logs` - contains log files
	- `webapps` - store web application files hosted by tomcat server
		- Package the web application into a `.war` file and and move it to `webapps` folder to host. If tomcat server is running, it will automatically detect the new app and host it.

## Deployments

#### Flask App
- Install dependencies - `pip install -r requirements.txt`
- Run the app
	- `python main.py` - good for running in development server (not in production)
	- For production, we need to run it in a production grade web server for Flask like **Gunicorn**, **uWSGI**, **Gevent** or **Twisted Web**.
	- `gunicorn <filename>:<flask-app-component>` eg. `gunicorn main:app`
	- `gunicorn main:app -w 3` - spawn 3 workers to host the flask app

#### NodeJS App
- Install dependencies - `npm install`
- Run the app
	- `node app.js` - if scripts `package.json` are emtpy
	- `npm run start` - if start script is present
	- For production, we need to run the app in a production grade web server for NodeJS like **SupervisorD**, **Forever** and **Process Manager 2 (PM2)**.
		- PM2 is a production grade process manager for NodeJS with built in load balancer
		- `pm2 start app.js`
		- `pm2 start app.js -i 3` - run 3 processes (workers)
		- `pm2 delete app.js` - terminate all the running processes of the app

## IP Addresses and Ports
- Computer systems like laptops or servers have multiple wired and wireless network interfaces for connectivity. 
- Once a system connects to network via an interface, the interface is assigned an IP address.
- Every network interface is divided into multiple logical components called ports (**max 65535 ports per IP address**). Each port is a communication endpoint. 
- Programs running on the system can listen on one of the ports for requests.
- A system can connect to the same network through two different interfaces and hence take up two IP addresses (one for each interface).
- When running an app, we can specify the IP on which the port should be opened for the app to listen on.
	- ![[attachments/Pasted image 20220923184027.png]]
- We can open the port on all the available IP addresses by specifying `host = 0.0.0.0`
	- ![[attachments/Pasted image 20220923184423.png]]
- If we don't want to open a port on an IP address on the network (eg, to test an app in our laptop's browser), we can omit the `host` field. In this case, the system opens the specified port on `127.0.0.1` (loopback address)
	- ![[attachments/Pasted image 20220923184838.png]]

> Every host has a built in virtual interface called **Loopback Address** which always equals `127.0.0.1`. Opening a port at this IP means opening it locally on the system (not the network). The loopback address it also referred to as `localhost`