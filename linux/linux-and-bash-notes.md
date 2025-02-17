
# Linux and Bash notes & code

- [Linux and Bash notes \& code](#linux-and-bash-notes--code)
  - [Linux notes](#linux-notes)
    - [Sudo](#sudo)
  - [Basic Linux OS navigation info](#basic-linux-os-navigation-info)
  - [Basic Bash commands](#basic-bash-commands)
  - [Basic OS navigation \& file creation/deletion commands](#basic-os-navigation--file-creationdeletion-commands)
  - [Permissions in Linux](#permissions-in-linux)
  - [Permissions-related commands](#permissions-related-commands)
  - [File \& text manipulation in Linux](#file--text-manipulation-in-linux)
  - [Variables in Linux](#variables-in-linux)
  - [Variables-related commands](#variables-related-commands)
  - [User account management commands](#user-account-management-commands)
  - [Processes](#processes)
  - [Process commands](#process-commands)
  - [Networking commands](#networking-commands)

## Linux notes

* When using multiple flags, you combine them all after the hyphen; order is preferential according to how you want the flags to be executed

-   `#!/bin/bash` — a shebang placed at the beginning of a file; tells the system a file is a bash script

-   Chain commands with `&&` between them; the second (and third, and so on) commands will only be executed if the previous one was successful

-   To quit a process, press ***q, ctrl-z,* or *ctrl-c***
-   When creating *.sh* script files, test the code manually in a shell **first** before including in script file
-   ***ctrl-S*** to save files when `nano`ing in Git Bash
-   Note that Linux uses spaces to chain multiple arguments for a command where allowed, e.g. `mkdir images docs videos` would create 3 directories, not one called "images docs videos"
-   Note that you can't trick Linux about a file's type by changing its file extension, like you can with windows e.g. if you rename a .jpg to a .txt, Linux will still know it's a jpp
-   Hitting **tab** when typing filenames will autocomplete if there's only one result matching current pattern
-   Use **up and down arrow keys** to cycle through command history
-   note that a **single > rewrites a given file** with the output of the preceding command, while **>> merely appends it**
-   note that it's likely better for code to be interepreted from `/bin/bash` not `/bin/sh`, because Nash is Sh 2.0 (offers more features and is more user-friendly)
-   *[command 1]* **|** *[command 2]* — this **pipe character** passes the output of one command as input to another, e.g.:
    -   `ps aux | grep node`
    -   or `ls -l | head -n 3 | tail -n 2 > results.txt` to first get the top 3 lines from `ls -l`'s output and then get the bottom 2 of these and create a `results.txt` file to hold the output

### Sudo

- `sudo` (super users) can:
  - perform system-wide admin tasks
  - install & update software packages
  - modify system configuration files
  - create, modify & delete other user accts 
- `sudo` logs who ran which command
- `sudo` is also the name of a group of users with sudo privileges; these users don't need to preface commands with `sudo` as they already have these privileges
-   `sudo [command]` — invokes superuser privileges to bypass any permissions issues in running the given command; note that system admins can still control who can run which commands this way
-   `sudo su` — switches to root user
-   `sudo !!` — reruns the previous command with superuser privileges


**Helpful commands to run first**

-  `sudo apt update` — checks if any packages can be upgraded; a good harmless way of checking you're connected to the internet

## Basic Linux OS navigation info

* Files and folders are organised in a hierarchical directory tree, with the main (**root**) directory branching off into folders (also called sub-directories) such as the **home** directory of given users
* Each OS's file system has a root directory, which is the **parent** for all directories in the file system — e.g. C:\ is the root for the C: drive
* The locations of files & directories are **paths**, which start at the root directory of a drive
* **Absolute path:** the full location of a file/directory from the root directory
* **Relative path (accessed using dot notation or tilde ~):** path based on the current working directory, doesn't specify the whole path e.g. `cd ../Videos`
* Note that in Linux,**child/sub-directories** are separated by forward slashes /, e.g. `/home/user1/Desktop`
* Note that in Windows, child/sub-directories are separated by backslashes \, e.g. `C:\user1\Desktop`
* Key directories in Linux:
    * `/bin` — the directory storing essential binaries or programmes
    *  `/etc` — stores important system configuration files
    * `user/home`— holds user documents, pictures, etc.; akin to Users in Windows
    * `/proc`— contains info about currently running processes
    * `/usr`— stores user-installed software
    * `/var` — stores system logs & constantly changing files
* **Notation:**
    * . — single dot before a path references the current directory
    * .. — double dot before a path references the parent directory of the current directory (i.e. the next directory up)
    * ~ — tilde; shortcut for path of **home** directory
    * / — shortcut for path of **root**  directory
* `.file_name` — dot before file name indicates it is hidden; can be used when echoing text to a file or creating (`touch`) a file


## Basic Bash commands
- `su [username]` — switches to given user
- `exit` — logs out of current user
- `echo "string_of_text"` — outputs given text to console
- `echo ~` — displays the path to home directory
- `echo "string_text" > [file_name] `— outputs text into given file, creating it if it doesn't already exist
  - `echo "string_text" >> [file_name] `— overwrites given file with given string
- `q` — quits any open Bash process that uses arrows to navigate
- `whoami` — outputs username of account currently logged into
- `id [optional: different user]` — outputs *user ID*, *group ID*, and *groups* of currently logged in (or optionally specified) user
- `sudo apt install [package_name]` — invokes superuser (*sudo*) status to gain permission to install given package
  - `-y` — adding this flag bypasses user input questions
- `sudo apt upgrade [optional package name or all packages by default]`— invokes superuser (*sudo*) status to gain permission to upgrade given package or all possible by default
  - `sudo apt upgrade -y` — bypass user input questions where possible
* `sudo systemctl restart [package name]`— restarts given package to apply changes
* `sudo systemctl status [package name]`— prints status of given package e.g. *active (running)*
* `sudo systemctl enable [package name]`— enables package so that it starts every time you start the VM; note that you need to restart the package after to apply this change
* `htop`— outputs CPU usage graph and stats on currently running processes, and interaction options e.g. f*ilter, search, sort by*; note that it must be `sudo apt install`ed first
* `ls <optional directory]` — lists files & sub-directories in optionally given directory
    * optional `-l` flag: gives detailed file info like *Show properties* on Windows GUI does e.g. permissions, owner, size, modification date; can also be called on some systems with just `ll`
    * optional: `-a`flag: "all files", shows all files including hidden ones in directory
  * `ls -lR`— lists detailed info recursively (i.e. for directories and their sub-directories and files)
     * `ls -ld`— lists detailed info of directories only (i.e. not their contents)
 * `file [filename]` — prints file type of given file
*  `-- help` — describes the given command and lists its syntax & parameters (including optional **flags**) in detail
* `man [command]` — shows manual pages for the given command, i.e. `help` command with some more detail
 * `history` — shows previous commands used though be sure not to do this in view if sensitive info has been included in commands; you can use arrow keys to scroll thru these e.g. if you wanted to create multiple folders with similar names; use **Ctrl-R** to search thru command history
 * `clear`— clears output in shell window; doesn't wipe history though

## Basic OS navigation & file creation/deletion commands

 * `pwd` — prints working directory
* `cd [directory if not home directory]` — changes directory; can be done using absolute or relative paths e.g. `cd /home/user1` or `cd ../Documents` (see double dot notation above)
    * `cd` or `cd ~` — shortcut for path of your root directory
    * `cd /`— shortcut for path of your home  directory
* `mkdir [name]`— creates a new directory w/given name; if using spaces, surround name with quotes or use backslash (Linux's 'escape' character) before each space e.g. creating Music Videos directory becomes `mkdir Music\ Videos`
  * `mkdir -p [directory_name/subdirectory_name]`— create a new directory plus its given subdirectory
 * `touch [name]`— creates a file with the given name; must be differently named than other files in its directory
 * `sudo nano [path/filename]`— opens up text file editor in command line
 * `cp [path/file] [destination path]`— copies a given file into given directory without deleting the original, e.g. `cp mycoolfile.txt ~/Desktop`
    * Use **wildcard character** to select all files to copy that follow a naming pattern (goes for other commands too), e.g. `cp *.png ~/Desktop`
     * To copy a directory and its contents, use `-r` parameter (note the order) e.g. `cp -r TestingDirectory ~/Desktop`
 * `mv [file/directory] [new name]` — renames file or directory to given name, e.g. `mv Song1.mp3 My_Favourite_Song.mp3`
* `mv [optional absolute or path relative path if not current, file/directory] [location/optional_rename]` — moves file or directory to given location, e.g. `mv Song1.mp3 ~/Music`; optional trailing name at end is if you want to move AND rename simultaneously
 * `rmdir [directory name]`— permanently deletes an **EMPTY** directory
* `rm [file file file separated by space]`— permanently deletes file(s) if user has the right permissions, e.g. `rm Song1.mp3`
  * `rm -r [directory]`— permanently deletes a non-empty directory using the recursive flag
  * rm -rf [directory]`— permanently and forcibly deletes a non-empty directory (i.e. no user confirmation required for each individual file)
  * `rm -i`— requires a further `yes` or `y` before completing requested deletion
  * `rm -f`— forces deletion without prompting; doesn't matter if files listed are nonexistent
* `curl -o [filename] [source url]` — downloads a file from given source and saves (i.e. outputs) it as filename (by default in pwd unless path provided)

## Permissions in Linux

* three levels of permissions:
    * **r** — read/access file or directory
    * **w** — modify the content
    * **x** — execute or run the file
* four sets of permissions in order:
    * **u** — first for user who created the file (file owner)
    * **g** — second for group (users in the same group as owner)
    * **o** — third for other (users not in the same group)
    * **a** — all users (not usually included in permissions detail; more for setting purposes)
* by default, file owners have read and write permissions and everyone else has read access; for folders, owner has all permissions and everyone else has read and execute permissions
  * owners don't automatically have execute permissions over their file because of Linux's **user mask (umask)**, which defines the default permissions
  * execute permissions are usually not given automatically to stop files being run as programmes that shouldn't, thereby protecting the system
  * the umask can be changed for a terminal session using `umask [value]` (see [possible values here](https://www.geeksforgeeks.org/umask-command-in-linux-with-examples/))
  * or permanently by editing the bashrc file like:
    * `echo "umask [value]" >> ~/.bashrc`
    * and then reloading this file like `source ~/.bashrc`
* permissions often decrease from left (user) to right (other) as users often have more permissions for a file than everyone else
* to view the file owner, run `ls -l`
* **groups** are used to allow or restrict access and permissions to directories and files
*  **permissions in symbolic textual format** (i.e. not using absolute octal numbers e.g. 700 or 333) include:
     *  who — *u/g/o/a* or empty for all; note that these are stackable e.g. *ug* or *go*
     *   the operation — + to add to existing permissions, with - to remove if permissions already set, and = to overwrite
     *   permission levels — r, w, or x
         *   e.g. `chmod u+x, o-r my_file.txt` adds execute permission to the user and removes read permission for others
        * e.g. `chmod go=rx` to overwrite permissions for group and others and give them read and execute permissions
* **permissions in absolute octal format** are:
     *  4 --- read
     *  2 --- write
     *  1 --- execute
     *  you **add** these to come up with a three-digit number symbolising permissions for user/group/others in that order, e.g. 777 means full permissions for all
  
  ## Permissions-related commands

*  `groups` — prints currently logged in user’s groups
* `sudo chmod [permissions] [filename]` — overwrites existing file permissions
    * in absolute octal (binary) format, `sudo chmod 644 my_file.txt` sets to read and write for user, read for everyone else — **note that *sudo* only needed if you don't own the file you're changing permissions for**
    * in symbolic format, `chmod go=rx` overwrites existing permissions for group and others and give them read and execute permissions
    * `sudo chmod -R [permissions] [directory]` — uses the -R flag to recursively change permissions for all sub-directories and files contained in directory
* `sudo chown new_owner:new_group [filename or directory]`— changes ownership of a file e.g. `sudo chown user1:group1 example.txt` — **note that *sudo* only needed if you don't own the file you're changing permissions for**
    * `sudo chown -R new_owner:new_group [directory]` — uses the -R flag to recursively change ownership for all sub-directories and files contained in directory
* `groupadd [group_name]`— creates a new group with given name
* `groupdel [group_name]` — deletes given group
* `useradd [user_name] -g [group_name]`— creates user with given name to given group
  * `useradd -m -d [/PATH/TO/FOLDER] [username]` — creates a user and defines their home directory
* `userdel [name]` — deletes user with given name
* `users` — prints users currently logged in
* `usermod [username] [option] [optional group]:`
    * `-aG` option — appends user to given group
    * `-rG` — removes user from given group

## File & text manipulation in Linux

* `cat [path/file name]`— displays the contents of the given file in the shell
  *  `-n`— optional flag to output all file contents on numbered lines in the shell
* `head [path/filename]`— shows the first 10 lines of the file
    * `head -1 [or any number of lines] [path/filename]`— shows the first however many number of lines of the file
    * `head -c1 [or any number of characters] [path/filename]`— shows the first however many characters (or more accurately, bytes) in the file
* `tail [path/filename]`— shows the last 10 lines of the file
    * `tail -n1 [or any number of lines] [path/filename]`— shows the last however many lines of the file
    * `tail -c1 [or any number of characters] [path/filename]`— shows the last however many characters (or more accurately, bytes) in the file
* `diff [first_file] [second_file]`— compares the two files and outputs the lines in each file that differ from each other
    * `diff -r [first_directory_path] [second_directory_path]`— compares the two directories and lists the files that are unique to each directory and their subdirectories
* `more [file name]`— displays the text in a long file one page at a time; navigate using arrow keys
* `less [file name]`— displays the first page (dependent on window's size) of a long file's contents in the shell; navigate using up, down, page up, and page down keys; press `q` to leave the command and return to the shell
* For any Linux OS distribution, you can use **Nano** as a text editor; other options are **Vim** and **Emacs**
* `nano [filename]` — opens the given text file in Nano for editing; Nano text editing options (e.g. search, cut) given on bottom of screen
* `grep [pattern in quotes] [filename]`— searches filname for given pattern
  * `grep -w [pattern in quotes] [filename]`— searches for given word, ensuring it is a standalone **word** not merely a pattern within another word
  * `[command with output] | grep [string to be searched]` — searches the output of the given command for the given string; note the usage of the **pipe character |**, e.g. `ps aux | grep node`
* `source [filename]`  executes or reloads a file, useful if it's a script that has been edited and needs reloading

## Variables in Linux

- as with everything in Linux, variables are case-sensitive
- to set a variable, do (note no spaces):
  - `my_variable="value"`
- may want to set a variable in a script for ease of readability
- to reference an existing variable, use $ before name, e.g. `print $MYNAME`
- **Environment variables** — variables used by a shell and its processes (i.e. all processes)
  - they are a good way for an application to access sensitive data, such as a connection string to a database
- Make normal variable an environmental variable to with `export` e.g. `export name="Farah"`
- By default, variables exist only for session
- to make them **persistent** (i.e. saved for future till deleted), add them to a (load-up-executed) **configuration file** like *.bashrc* in **root**
- note that *.bashrc* is user-specific so would need to find a user-wide config file (e.g. /etc/environment) if wanting to store variable for all users (this is only relevant sometimes though, so better to use non-persistent in case of sensitive data)

## Variables-related commands 

- `printenv [optional: name of specific env variable, likely in uppercase]` — prints environment variables in current directory; all if no variable name specified
- `export [variablename]`— makes normal variable an environmental variable
- `echo "export_command_to_be_appended" [optional path/config_file_name]` — adds export command to end of config file, which makes a new  environmental variable that is either temporary (if in a file like *.bashrc*) or persistent (i.e. permanent, if in a user-wide config file like */etc/environment*) 

## User account management commands

* `su [username]` — switches to given user
* `sudo useradd [name]`— invokes super-user/admin privileges and adds user to system with given name with no home directory
    * `sudo useradd -m [name]` — adds user with home directory (m flag)
* To confirm a user has been added to the system, search their username (using `grep -w`) in the `/etc/passwd` file, which is Linux's "phonebook" showing all users, e.g. `sudo grep -w 'farah' /etc/passwd`
* This outputs something like `john:x:5001:5001::/home/john:/bin/sh`:
    * Which is in the format of username:password:userID:groupID:home-directory:default-shell
* `sudo passwd [username]` — sets given password to given user (next step is to enter this password twice, invisibly)
  * `sudo passwd -l [username]` — locks the password of the given user, meaning they can't log in (they will receive an "authentication failure" message in the shell)
  * `sudo passwd -u [username]` — unlocks the password of the given previously-locked user
* `usermod [options]` — modifies given user's account settings
  * `usermod -d [new directory to be set] [user]` — modifies the home directory for given user to given folder
  *  `usermod -s [optional path to new shell to be set] [user]` — modifies the shell for given user (*/bin/bash* is preferred bc of enhanced features); if no path set, then it will set to the system's default shell
* `groupadd [group_name]`— creates a new group with given name
* `groupdel [group_name]` — deletes given group
* `groups [user_name]` — prints the groups that given user is in
* `useradd [user_name] -g [group_name]`— creates user with given name and adds to given group 
* `userdel [name]` — deletes user with given name
  * `userdel -r [name]` — deletes user with given name and also removes their home directory and mail spool
* `users` — prints users currently logged in
* `usermod [username] [option] [optional group]`:
    * `-a -G` option — appends user to given group
    * `-r -G` — removes user from given group

## Processes

- a **process** is a programme that's loaded into the RAM; whether or not it's currently being run, it's a process if it's in memory
- processes can be parent processes or their child processes
- **user processes**: created by the user
- **system processes**: created by the OS

## Process commands

- `ps` — outputs user processes currently running, includes process ID and terminal ID
  - `ps aux [or -e -A]` — outputs all processes, including user and system processes (note that `aux` includes more detail)
  - ps aux - ??? to add column to default view showing parent processes (is it -efj?)
- `top` — outputs all live processes, ordered by CPU usage in descending order
  - use `shift-m` while in `top` to reorder by Memory usage
  - use `shift-n` to reorder by Newest processes, etc.
- `sleep [time in seconds]` — pauses orm in a script, causes a delay between commands for given number of seconds
- `[command] &` — runs given process in background; outputs process ID in terminal
- `jobs` (doesn't show process id without -l? flag)
- `sudo systemctl stop [process]` — stops given process
- `kill [process id]` — medium-level kill by default (which is also called terminating gracefully); first tries to terminate any child processes then the parent; **always try this first to avoid zombie processes**; outputs *Terminated*
  - `kill -1 [process id]` — gentlest level of `kill`, outputs *Hangup*
  - `kill -9 [process id]` — harshest level of `kill`; uses brute force; **only use when other levels don't work** because child processes become zombie processes and will be left running in memory and will require manual destroying (won't necessarily cause harm but will be using RAM); outputs *Killed*

## Networking commands

* `ifconfig` — tells you your IP, MAC addresses etc and outputs details on network interfaces
* `iwconfig` — similar to ifconfig but focused on wireless network interfaces 
* `ping` — verifies your computer can communicate with other machines on the network
* `arp` — finds IP to MAC address mappings; short for Address Resolution Protocol
* `netstat` — outputs basic statistics on network activities and details on ports in use and the processes using them
* `route` — outputs the routing table