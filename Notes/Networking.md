---
created: 2022-09-21T23:09:59-04:00
updated: 2022-09-22T15:09:34-04:00
---
[[Pre-Requisites]]

---
# Networking

## Switch
![[attachments/Pasted image 20220921231550.png]]
- Switch is a computer hardware connecting computers on a network
- Switch can facilitate communication only in the same network (subnet)
- Switch doesn't have DHCP so it doesn't auto-assign local IPs to connected devices
- We can assign an IP address to the network interface on each computer. Then the computers can communicate with each other.

## Router
![[attachments/Pasted image 20220922000630.png]]
- Router is a computer hardware that connects multiple networks (subnets) together so that devices on the two networks can communicate with each other. 
- Router is assigned different IPs in the different networks
- To view the route table of the system run the `route` command
- Router acts as a gateway between two networks. 
- Router is not required to connect devices on the same network. The entry for the same subnet in the route table has gateway as 0.0.0.0 (not required)
	- ![[attachments/Pasted image 20220922003020.png]]
	-
- Commands (changes made are only valid till restart)
	- `ip link` - list and modify interfaces on the linux host
	- `ip addr` - view IP addresses assigned to the interfaces on the host
	- `ip addr add 192.168.2.0/24 dev eth0` - set IP addresses to an interface
	- `ip route add 192.168.2.0/24 via 192.168.1.1` - add routes to the routing table

> [!question]- How will device B communicate with device C?
> We need to add a route in the routing table of device B to direct all the traffic going to subnet 192.168.2.0/24 to go via 192.168.1.1 which is the router. 
> `ip route add 192.168.2.0/24 via 192.168.1.1`
> 
> Similarly, if device C wants to communicate with device A, it will have to update its routing table to route the request through the router. So, routing table needs to be configured on all the devices to ensure proper communication.
> 
> Instead, we can add a default route on all the devices to route all requests going outside the current network to pass through the router (the router IP address will depend on the network the device is connect to)
> `ip route add default via 192.168.1.1` or `ip route add 0.0.0.0 via 192.168.1.1`

#### Connecting to the Internet
![[attachments/Pasted image 20220922003539.png]]
- Connect router to the internet and create a default gateway on all the devices to route external requests through the router.

#### Using Multiple Routers
![[attachments/Pasted image 20220922003811.png]]
- One for internal network, one for internet
- Need to create two routes 
	- ![[attachments/Pasted image 20220922003916.png]]

#### Linux host as Router
![[attachments/Pasted image 20220922004320.png]]
- A and C are on different networks and B is on both. 
- If we ping C from A, we get "Network unreachable" error
- Add a route in A to route to C's network via B to allow the request from A to pass through B.
- Add a route in C to route to A's network via B to allow the response from C to pass through B.
- Now, if we ping C from A, we don't get "Network unreachable" error which means that the route tables are configured correctly. 
- But, we don't get any response back because by default in Linux, packets are not forwarded from one interface to another. This means **IP Forwarding** is disabled by default. (eg. packets received on eth0 are not forwarded to eth1 on B). This is for security reasons.
- We can enable **IP Forwarding** between interfaces on a Linux system by setting the value in the file `/proc/sys/net/ipv4/ip_forward` to 1
	- `echo 1 > /proc/sys/net/ipv4/ip_forward`
	- To persist this change between reboots, modify `/etc/sysctl.conf` and set `net.ipv4.ip_forward = 1`
- Now, if we ping C from A, we get response back

## DNS

#### DNS for Private Network
![[attachments/Pasted image 20220922115149.png]]
- Two devices A and B on the same network, they can ping each other using IP addresses
- Add IP of B in A's hosts table
	- ![[attachments/Pasted image 20220922115941.png]]
- Now A can ping B using the hostname `ping db`
- Translating hostname to IP is known as **Name Resolution**

> We can even fool A into believing that B is `google.com` by naming it www.google.com in A's `/etc/hosts`

- In a small network, name resolution can be easily managed by using `/etc/hosts` file. Every system will store the names of every other system in the network. 
	- ![[attachments/Pasted image 20220922120721.png]]
- If the network grows, managing name resolution becomes difficult. If the IP of one of the system changes, the `/etc/hosts` file of all the other systems need to be updated. So, instead of each system managing its own hosts, we can shift the entries of the `/etc/hosts` file into a dedicated server to manage centrally. Then, we can point all the systems to this server to query the IP from the hostname. This is our **DNS server**.
- To point any device to the DNS server, edit the `/etc/resolv.conf` file to add the IP address of the DNS server. Repeat this for all the devices on the network.
	- ![[attachments/Pasted image 20220922122941.png]]
- If the IP address of any device on the network changes, simply update its entry on the DNS server. No need to update the `/etc/hosts` file on the other devices.
- In this setup, if you need to setup a test server, you can add it's hostname in your `/etc/hosts` file so that others are not able to resolve it's IP.

> The system first tries to resolve the hostname from the `/etc/hosts` file available locally. If it could not be resolved, then it queries the remote DNS.

#### DNS for Internet Connectivity
- Edit the `/etc/resolv.conf` file on any system to add Google's name server `8.8.8.8` which will allow the system to ping unknown hostnames such as `www.facebook.com`. 
	- ![[attachments/Pasted image 20220922143525.png]]
- If we want internet connectivity on every system in the local network, we need to set this up on every system on the network. Instead, we can configure the DNS server to forward all unknown requests to `8.8.8.8`. Now, all the devices on the network can ping external sites.

> To resolve `maps` as `maps.google.com`, add `search google.com` to `/etc/resolv.conf` file

#### DNS Commands
- `nslookup www.google.com`
	- Command line tool to query a hostname from DNS server
	- Does not look into `/etc/hosts`, only queries the DNS
- `dig www.google.com`