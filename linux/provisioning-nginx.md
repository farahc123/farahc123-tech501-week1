# Provisioning Nginx

The following is the *provision.sh* script I created for installing, updating, upgrading, and enabling the Nginx package:

> 
>
>\# tells the interpreter this file is a bash script so it will run it path leads to the interpreter to be used to execute the commands
>
>`\#!/bin/bash`
>
>\# looks for updates for packages
>
>`sudo apt update`
>
>\# upgrades packages based on available updates found above
>
>`sudo apt upgrade -y`
>
>\# install nginx
>
>`sudo apt install nginx`
>
>
>\# enable nginx - this means it will start up when we start the VM
>
>`sudo systemctl enable nginx`
>
>\# restart nginx now it's enabled
>
>`sudo systemctl restart nginx`

