# Provisioning Nginx

The following is the provision.sh script I created for installing, updating, upgrading, and enabling the Nginx package:

> \#!/bin/bash
>
>\# above line tells the interpreter this file is a bash script so it will run it path leads to the interpreter to be used to execute the commands
>
>\# looks for updates for packages
>
>sudo apt update
>
>\# upgrades packages based on available updates found above
>
>sudo apt upgrade -y
>
>\# install nginx
>
>sudo apt install nginx
>
>\# restart nginx
>
>sudo systemctl restart nginx
>
>\# enable nginx - this means it will start up when we start the VM
>
>sudo systemctl enable nginx

