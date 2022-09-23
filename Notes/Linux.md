---
created: 2022-09-14T12:15:42-04:00
updated: 2022-09-21T23:07:27-04:00
---
[[Pre-Requisites]]

---
# Linux
- All the cloud and DevOps tools are made to run on Linux 
- Ubuntu is based on the Debian architecture
- CentOS is based on the Red Hat Enterprise Linux (RHEL) architecture

## User Accounts
- Root user has unlimited access to the system
- Root user needs to grant a normal user root previlege by making an entry in the `/etc/sudoers` file. The normal user can then escalate their previlege by prefixing their command with `sudo` 

## Important Commands
- `echo $SHELL` - get shell type
- `mkdir -p user/abdur/add` - make directory hierarchy
- `cat > file.txt` - add contents to a file
- `whoami` - get user info
- `id` - get user's id and group
- `su <username>` - switch user
- `sudo su -` - switch to root user
- `ssh <username>@192.168.1.1` - ssh as a user into a system
- `wget <file-url> -O file.txt` - download a file

## Package Managers
- Package managers download the necessary dependencies when installing packages in Linux
- **CentOS** uses **Yum**, an RPM (RedHat Package Manager) based package manager
	- ![[attachments/Pasted image 20220915104247.png]]
- Commands
	- `yum install ansible` - install a package
	- `yum repolist` - list the repositories
	- `yum list` - list installed packages
	- `yum list <package-name>` - search for a package in the list of installed packages
	- `yum remove <package-name>` - remove a package
	- `yum --show-duplicates list <package-name>` - list all the installed versions of a package
	- `yum install ansible-2.4.2.0` - install a specific version of a package

## Services
- Services in Linux help us configure software to run in the background and ensure that they run automatically even if the servers are rebooted. Eg. Docker
- If there are multiple interdependent services, they should follow the order of startup.
- `systemctl` command is used to manage `systemd` services
- Commands - might need to use **sudo**
	- `systemctl start httpd` - start an service (HTTPD)
	- `systemctl stop httpd` - stop a running service
	- `systemctl status httpd` - check the status of a service
	- `systemctl enable httpd` - configure the service to start at startup
	- `systemctl disable httpd` - configure the service to not start at startup
	- `systemctl daemon-reload` - reload the systemd

#### Configure an application as a Service
- Let's assume a Python server app that runs at port 5000 and prints "Hello World"
- We want to configure this app as a service
- Create a new file `my_app.service` in the `/etc/systemd/system` directory and paste the following in it
```
[Service]
ExecStart=<command to start your app>
```
- `systemctl daemon-reload`  - reload the systemd to let it know that a new service has been configured 
- `systemctl start my_app` - start your app as a service
- To configure the service to run when the system boots up, add the following to the service file
```
[Install]
WantedBy=multi-user.target
```
- To add description
```
[Unit]
Description=My best Python app
```
- To restart the application if it crashes
```
[Service]
Restart=always
```
- To run scripts before and after running the app
```
[Service]
ExecStartPre=/opt/code/configure.sh
ExecStartPost=/opt/code/result.sh
```

#### Docker as a Service
- Once Docker is installed, the Docker daemon runs as a background process that listens for docker commands
- Docker installation creates a service file with the following contents
	- ![[attachments/Pasted image 20220921225448.png]]