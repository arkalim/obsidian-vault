---
created: 2022-09-23T21:55:19-04:00
updated: 2022-09-23T23:17:56-04:00
---
[[Pre-Requisites]]

---
# Database
- DevOps engineers deploy and manage databases
- SQL databases represent data in tabular format whereas noSQL databases represent data in documents.

## MySQL
- Open-source SQL database
- Used by FaceBook and YouTube
- `yum install mysql-server` - install MySQL on CentOS
- `systemctl start mysqld` - start the MySQL service
- Logs are available at `/var/log/mysqld.log`
	- When `mysqld` service is started, the logs contain a temporary password required to log into the MySQL database.
- `mysql -u root -p` - login to the DB as root user (you will be prompted to enter password)
- Commands
	- `ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPassword'` - change the password for root user
	- `SHOW DATABASES`
	- `CREATE DATABASE Students`
	- `USE Students` - Switch to Students database (can only work on 1 database at a time)
	- Once a DB is selected, you can create tables, insert values in them and so on...

#### User Management
- Root users have admin access to the DB
- Create additional users - `CREATE USER 'john'@'localhost' IDENTIFIED BY 'password'`
- `'john'@'localhost'` means that the user `john` can connect from the local host, he will be denied access if he tries to connect from another host. 
- `'john'@'192.168.1.10'` means that the user  `john` can connect from the host with IP `192.168.1.10`
- `'john'@'%'` means that the user `john` can connect from any host

>[!tip]+ Assigning privileges to the users
> ![[attachments/Pasted image 20220923222223.png]]

## MongoDB
- Open-source NoSQL database
- Data is organized into documents 
- Multiple documents form a collection
- Multiple collections form a database
- We can have multiple databases within a MongoDB server
- MongoDB is available as a cloud offering or as on-premises server
- `yum install mongodb-org`
- `systemctl start mongod` - start the MongoDB service
- Logs are stored at `/var/log/mongodb/mongod.1og`
- Configuration file is available at `/etc/mongod.conf`
- Commands
	- `mongo` - activate mongo shell
	- `show dbs` - show databases
	- `use school` - switch to school DB (if not present, create new and switch)