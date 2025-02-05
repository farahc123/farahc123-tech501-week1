# Nginx- and package-specific info

- [Nginx- and package-specific info](#nginx--and-package-specific-info)
  - [Installing packages](#installing-packages)
  - [Nginx](#nginx)
  - [Tree package](#tree-package)

## Installing packages

- 
- To check a package has been installed, <code>  \<package name> -v </code> to get the version in Git Bash


## Nginx 

-   ***nginx*** — web server software
-   note that you may need to **restart** nginx to apply changes if you have made any 
- ***sudo apt install*** *[package_name]* — invokes superuser (*sudo*) status to gain permission to install given package
  -  ***sudo apt-get install*** *[package_name]* — invokes superuser (*sudo*) status to gain permission to download and install given package
  - ***-y*** — adding this flag bypasses user input questions
- ***sudo apt upgrade*** *[optional package name or all packages by default]*— invokes superuser (*sudo*) status to gain permission to upgrade given package or all possible by default
  - ***sudo apt upgrade [optional package(s)] -y*** — bypass user input questions where possible
- You may need to restart ***nginx*** to apply changes if you have made any using:
  * ***sudo systemctl restart [package name]***— restarts given package to apple changes
* ***sudo systemctl status [package name]***— prints status of given package e.g. *active (running)*
* ***sudo systemctl enable [package name]***— enables package so that it starts every time you start the VM
* ***cp [optional path if not pwd/file-name] [then optional path for destination/new name if needed or add .bak]*** — creates a backup of a file and renames it, e.g. ***cp index.html index.bak*** which backs up an index.html file

## Tree package

- prints visual map of file/directory relationships in current working directory
- command:
  - ***tree [current directory by default, or specify a path]***