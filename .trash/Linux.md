---
created: 2022-06-03T19:22:35+05:30
updated: 2022-06-03T19:22:35+05:30
---
[[Notes]]

---
# Linux

## Theory
### Operating System
- Most operating systems can be grouped into two families:
- The Microsoft NT descendants including Windows, Xbox Os, and Windows Phone /Mobile
- Pretty much everything else has lineage going back to Unix, including Mac OS X, Linux, Android, Chrome OS, and even the PS4 OS
-   Kernel
	- Kernel is a part of an OS that facilitates interactions between hardware and software. Linux is not an OS, it is just a kernel (part of the OS)
		- ![[attachments/Pasted image 20220603192111.png]]
    
-   Linux Distributions
	- The Linux Kernel itself is not a full-blown operating system. When people talk about a Linux-based operating system, they are referring to Linux distributions. Typically, a Linux distribution bundles together the Linux kernel, GNU tools, documentation, a package manager, a window system, and desktop environment. There are nearly 1000 Linux distros available. Some of the more popular ones includes Fedora, Ubuntu, Debian, and Slackware.
    
-   Shell
	- A shell is a computer interface to an operating system. Shells expose the OS's services to human users or other programs. The shell takes our commands and gives them to the operating system to perform. Linux commands run via a shell.
	- It's named a shell because it is the outer layer around the OS, like the shell around an oyster!
	- Shells are of various types but they all do the same thing (run linux commands)
	    -   Bourne Shell (sh)
	    -   Korn Shell (ksh)
	    -   Bourse Again Shell (bash)
	    -   zsh
-   Permissions
    
    Linux was designed to allow multiple users to access a single system at the same time. So, every file needs to be protected. There is also the concept of group permissions where all developers can be put into a group and a set of permissions can be attached to each file for that group.
    
    Permissions in Linux are of three types:
    
    -   Read (4)
    -   Write (2)
    -   Execute (1)
    
    Directories always have execute permission onto them which allows the user to get into the folder.
    
    -   Permission Structure
        
        ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/44f460ab-ff5a-4e66-a144-0f0c351c3996/Untitled.png)
        
        ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/58ea4ac8-8c58-4ed8-9916-01becbd522ed/Untitled.png)
        
    
    When changing permissions for a file:
    
    777 - full permission
    
    400 - read only (required for `.pem` keys)
    
-   Expansions
    
    These are some keywords that the shell interprets:
    
    -   `~` path of home directory
        
        `cd ~/Desktop`
        
    -   `$` environment variables
        
        `$PATH` path variable
        
        `$USER` user variable
        
    -   `*` all paths (wildcard)
        
        -   `ls *.txt` print every text file in the current directory
    -   `?` any character
        
        -   `ls *.??` matches `app.js` `main.py` etc.
    -   `{}` iterator
        
        -   `touch app.{py, js, html, css}` create four files with the extensions as given
        -   `touch Journal-{1..365}.txt` iterate over numbers

# Commands

-   `uname` prints the kind of system you are running.
    
-   `man commandName` prints the manual for a linux command.
    
-   `uptime` print how long your system has been up.
    
-   `pwd` print current working directory
    
-   `mkdir my-dir` make a directory by the name `my-dir`
    
-   `alias greet="nano hello.txt"` create a temporary alias of a command
    
    To make this permanent, write this in `.zprofile` present in root
    
-   `whoami` print the username
    
-   `cd`
    
    -   `cd` navigate to home directory
    -   `cd ..` move one directory up
-   `ls` list directories
    
    -   `ls` list items in the current directory
        
    -   `ls folder_path` list items inside a directory at a path
        
    -   `ls -a` list all the files including hidden files (starts with a dot)
        
    -   `ll` or `ls -l` long list items in the current directory
        
        ### Sample output
        
        ```bash
        ❯ ll
        total 59312
        -r--------@  1 arkalim  staff   1.7K Mar 10 19:47 EC2Tutorial.pem
        -rw-r--r--@  1 arkalim  staff    29M Mar  5 19:46 Slides.pdf
        drwxr-xr-x@ 16 arkalim  staff   512B Sep  6  2021 code
        ```
        
        If the first letter is:
        
        `-` the item is a file
        
        `d` the item is a directory
        
    -   `la` long list all files in the current directory
        
    -   `ls *.txt` list all text files
        
    -   `ls *.??` list all files that have 2 characters in their extension
        
-   `rm` remove files and folders
    
    -   `rm hello-world.txt` delete a file
    -   `rm hello.txt world.png` delete multiple files
    -   `rm -r folder-name` delete a folder recursively (folders cannot be deleted non-recursively)
    -   `rm -f hello-world.txt` forcefully delete a file
    -   `rm -rf folder-name` forcefully delete a folder
    -   `rm -v filename` delete a file and print the deleted item
    -   `rm -rv folder-name` delete a folder and print the deleted items
-   `touch` create empty files
    
    -   `touch hello-world.txt` create an empty file
    -   `touch hello.png world.txt` create multiple empty files
-   `history`
    
    -   `history` print the history of commands run on the terminal
    -   `history > log.txt` export the history of commands to a text file
-   `open` open a file or folder in Mac
    
    -   `open .` open the current working directory in finder
    -   `open filename` open a file in the default application
    
    <aside> 💡 only works in Mac OS
    
    </aside>
    
-   `xdg-open` open a file or folder in Ubuntu
    
    -   `xdg-open .` open the current working directory in finder
    -   `xdg-open filename` open a file in the default application
-   `mv` move & rename files and folders
    
    -   `mv helo.txt hello.txt` rename helo.txt file to hello.txt
    -   `mv folder_name1 folder_name2` rename folder
    -   `mv hello.txt folder_name` move a file inside a folder
    -   `mv folder_name ../` move folder one step back
    -   `mv hello.txt world.png folder_name` move multiple files in a folder
-   `cp` copy files & folders
    
    -   `cp hello.png world.png` make a copy of a file with the given name
    -   `cp -r folder1 folder2` recursively make a copy of a folder
    -   `cp hello.txt folder_name/there.txt` copy a file into a folder with a given file name
    -   `cp folder1/hello.txt folder2/there.txt` copy a file from one folder to another
-   `head` print the beginning of a file
    
    -   `head hello-world.txt` print the first 10 lines of a file on the terminal
    -   `head hello-world.txt -n 100` print the first 100 lines of a file on the terminal
-   `tail` print the end of a file
    
    -   `tail hello-world.txt` print the last 10 lines of a file on the terminal
    -   `tail hello-world.txt -n 100` print the last 100 lines of a file on the terminal
-   `cat` print & concatenate files
    
    -   `cat hello-world.txt` print the contents of a file on the terminal
    -   `cat hello.txt world.txt` print the contents of a file on the terminal
    -   `cat -n hello.txt` print the contents of a file along with the line numbers
    -   `cat hello.txt world.txt > hello-world.txt` save the concatenated outputs of multiple files into a single file
-   `echo` add lines to a file
    
    -   `echo “hello world!”` print some text to the terminal
    -   `echo “USERNAME=ABDUR” > config.txt` input some text into a file (create new if not already exists, update if already exists)
    -   `echo “PASSWORD=RAHMAN” >> config.txt` append some text at the end of a file
    -   `echo *` print every path in the current directory
    -   `echo *.txt` print every path that ends with `.txt`
-   `wc` count words in a file
    
    `wc helloworld.txt` count the number of lines, words and bytes in a file
    
-   `sort` print a sorted version of a file (not in place)
    
    -   `sort items.txt` sort alphabetically
    -   `sort -r items.txt` sort alphabetically (decreasing)
    -   `sort -n items.txt` sort numerically
    -   `sort -nr items.txt` sort numerically (decreasing)
    -   `sort -u items.txt` sort unique items
-   `diff` get diff between two files
    
    -   `diff file1.txt file2.txt` find the diff between the two files
    -   `diff -u file1.txt file2.txt` get file diff with verbose context
-   `find` search recursively for some file or folder
    
    -   `find .` find every file or folder in the current directory
    -   `find . -name ‘*7*’` find any file or folder that have 7 in their name
    -   `find . -iname ‘*E*’` find any file or folder that have E or e in their name (case insensitive)
    -   `find ~/Desktop -name ‘*.py’` find all python files in Desktop
    -   `find . -type d -name 'S*'` find directories starting with S
    -   `find . -type f -name 'S*'` find files starting with S
    -   `find . -type f -name 'S*' -or -name 'T*'` find files starting with S or T
    -   `find . -type f -size +100k -size -1M` find files with size greater than 100kB and smaller than 1MB
-   `grep` search for a some text in a file or folder
    
    -   `grep getItem main.js` look for “getItem” in main.js file
    -   `grep -i getItem main.js` look for “getItem” in main.js file (case insensitive)
    -   `grep -n getItem main.js` look for “getItem” in main.js file with line numbers of the matches
    -   `grep -nC 2 getItem main.js` look for “getItem” in main.js file with line numbers and two lines above and below the match
    -   `grep -r getItem .` search recursively for “getItem” in the current directory
    -   `grep '^[a-z]' config.txt` search using RegEx
-   `du` get disk usage
    
    -   `du` get disk usage of each file in the current directory
    -   `du -h` get human readable disk usage
    -   `du folder_name` get disk usage of a folder
    -   `du -h | sort -h | tail` get the ten largest files and folders
-   `df` disk utility
    
    -   `df -h` human readable
    -   `df -h Desktop` get disk information about a specific directory
-   `history` history of linux commands run
    
    -   `!command_number` re-run any command from the history using it’s number
    -   `history | grep 'start’` search for something in the history of commands
-   `ps` view running processes
    
    -   `ps` view processes started by me
    -   `ps axww` view all the processes
    -   `ps axww | grep 'Visual Studio Code'` search for the processes based on a keyword
-   `top` view top CPU intensive processes
    
    -   `top -o mem` view top memory intensive processes
    
    <aside> 💡 Press Q or Ctrl + C to exit
    
    </aside>
    
-   `kill` kill a process
    
    -   `kill <pid>` terminate a process gently
    -   `kill -9 <pid>` force kill a process
-   `chmod 400 hello-world.txt` modify the permission of a file (see theory on permission for more details)
    

# Joins

-   `>` store the output of a command to a file
    -   `ls > config.txt` store the output of `ls` into `config.txt`
    -   `ls -a | wc > items.txt` count the number of files and store it in a file
-   `|` piping: pass the output of one command into another command
    -   `ls -a | wc` count the number of files
    -   `cat hello.txt world.txt | sort` sort concatenated files

# Applications

## Ranger

-   Easier navigation through directories
-   Prevents using `cd` and `ls`

Installation: `brew install ranger`

# Resources

[Linux command for programmers | Crash course](https://www.youtube.com/watch?v=jUklCapWN5w)

[The 50 Most Popular Linux & Terminal Commands - Full Course for Beginners](https://www.youtube.com/watch?v=ZtqBQ68cfJc)