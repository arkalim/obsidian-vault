---
created: 2022-09-22T15:15:05-04:00
updated: 2022-09-22T21:32:50-04:00
---
[[Pre-Requisites]]

---
# Apps
- As a DevOps engineer, you should be aware of the basics of programming and the software development lifecycle.

## Compilers
- Older compilers used to compile directly into machine code which was specific to a processor set. So, it could not be run on other machines.
- Modern compilers convert to an intermediate code called as **Byte Code** which is then run by the interpreter (in case of interpreted languages)

## Languages

#### Java
- **JDK (Java Development Kit)** - tool to develop, build and run Java applications
	- ![[attachments/Pasted image 20220922161712.png]]
	- javac - used for compiling
	- javadoc - used for documentation
	- jdb - used for debugging
- Java code compilation and execution process
	- ![[attachments/Pasted image 20220922162328.png]]
	- Source code is compiled into byte-code
- **Java Archive (JAR)** is a packaging format to package multiple java `.class` files and dependent libraries into a single distributable package in `.jar` format.
	- `jar cf MyApp.jar MyClass.class Service1.class Service2.class ...` - to create a jar file
	- `java -jar MyApp.jar` - run a jar file
- **Web Archive (WAR)** is a packaging format to package all the contents of `.jar` along with images and static contents required to build a web application. 
- **JavaDoc** is a tool to automatically generate documentation of the code 
	- `javadoc -d doc MyClass.java` - generate documentation for the given java file
- **Java Application Build Process**
	- ![[attachments/Pasted image 20220922163630.png]]
- Application build process can be automated using **Build Tools** like **Maven**, **Gradle** & **ANT**. They use configuration files where we can specify build steps
	- ![[attachments/Pasted image 20220922164033.png]]

#### JavaScript / NodeJS
- JavaScript was originally developed as a client side scripting language
- NodeJS brought JS to the server side
- NodeJS can handle a large number of concurrent connections by implementing a non-blocking IO model
- Node Package Manager (NPM) is a package manager and repository of publicly available NodeJS packages
	- `npm -v` - get the NPM version
	- `npm install serverless` - install a package
	- `npm install -g serverless` - install a package globally
	- `npm uninstall serverless` - uninstall a package
	- `npm search serverless` - search a package
- When importing a package in the code, node looks at the local `node_modules` folder under the application folder. If not found, it looks at the global `node_modules` directory. To see the list of paths node scans, run `node -e "console.log(module.paths)"`
- Application dependencies are stored as configuration in `package.json` file at the root of the application directory.

#### Python
- Server-side scripting language heavily used in Analytics
- Both Python2 and Python3 can be installed on the system simulatneously
- Pip Install Package (PIP) - package manager for Python
	- `pip2 install numpy` - python2
	- `pip3 install numpy` - python3
	- `pip -V` - check which python pip is pointing to
	- `pip show numpy` - show where a package is installed
	- `pip install numpy --upgrade` - version upgrade a package
	- `pip uninstall numpy` - uninstall a package
- Application dependencies should be written in `requirements.txt` and installed by running 
  `pip install -r requirements.txt`