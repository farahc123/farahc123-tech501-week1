 # Azure notes

- [Azure notes](#azure-notes)
  - [Our Azure virtual network](#our-azure-virtual-network)
  - [**Week 1 first app virtual machine**](#week-1-first-app-virtual-machine)
  - [Logging in and out of the VM](#logging-in-and-out-of-the-vm)
  - [General Azure instructions](#general-azure-instructions)
  - [Week 1 second app VM](#week-1-second-app-vm)



> ## [For Sparta: see important rules about use]

## Our Azure virtual network

-   **Our vnet:**
> -   **Name**: tech501-farah-2-subnet-vnet
>-   **Region**: UK South
>-   **Space**: CIDR
> - **IP**: 10.0.0.1/16 (i.e. 65k+ IP addresses)
>   -   Note that these are in IPv4
>   -   This will be split into public-subnet and a private-subnet
>-   **public-subnet**: private IP address within 10.0.2.0/24 (i.e. 256 IP addresses)
>-   **private-subnet**: private IP address within 10.0.3.0/24

  ## **Week 1 first app virtual machine**
  - note that this can take a couple of minutes to deploy once created:
> -   **Name**: tech501-farah-first-vm
>-   **Region**: UK South
>-   **Security**: Standard (NOT Trusted Launch)
>-   **Image** (i.e. the OS that will go onto the machine): Ubuntu Pro 18.04 LTS Gen 2 [LTS means long term support for ~7 years]
>-   **Size**: Standard_B1s — 1 vcpu, 1 GiB [very important to set correctly because this impacts pricing]
>-   **Administrator account**: adminuser
>-   Use existing key pair already added to Azure (the one with my name)
>-   **Select inbound ports**: allow HTTP and SSH traffic
>-   **Disks** tab:
 >     -   **OS disk type**: Standard SSD
 > - **Networking** tab:
>   - **Virtual network**: my named version
>   - **Subnet**: public-subnet
>   - Enable ***Delete public IP and NIC when VM is deleted*** option
 > -   **Tags:**
 >      - Owner: Farah
-   Note that VMs run as soon as they are successfully created so **need stopping from resource page before going on breaks**
-   To delete this VMand all its elements, delete all resources that begin with "*tech501-farah-first-vm-*" from the resource group

## Logging in and out of the VM

-   To log in and out of a VM on Azure:

    -   Start (maybe wait 30 seconds)

    -   Connect via **Native SSH**

    -   Paste SSH key name in (optionally preceeded my its path unless SSHing in from the *.ssh* folder)

    -   Copy resulting modified output

    -   In Git Bash, paste this (note the path; easiest to be in *.ssh* folder) and submit — now logged in! (note that on first login, you will need to confirm with a *yes*)

    -   Use ***exit*** command to log out

## General Azure instructions

-   Be sure to add tags when creating a resource (**Name**: Owner, **Value**: Farah)

-   To delete, can either go into the resource and press Delete on toolbar, or to delete multiple resources, go to resource group, tick them, and press three dots in top right and delete (need to confirm with keyboard)
-  BE SURE NOT TO DELETE THE RESOURCE GROUP BY ACCIDENT
-   when deleting a VM, delete everything associated with its name (e.g. if VM ends with *week1-vm*, everything with *week1-vm* in its name is associated with it): so VM, IP, network security group, network interface, disk
-   When uploading an existing SSH key to Azure, best practice is to give it the same name as it has on local machine for easier matching (can ignore the "*.pub*" part)
    -   Ensure that you upload the **public key** to Azure, not the private — this can be verified by checking last line of its contents doesn't notify us that it's private
- Azure's API (interface manager) is called **ARM**

## Week 1 second app VM

> **Basics tab**:
> - **Name**: tech501-farah-first-deploy-app-vm
> - **Security type**: Standard (NOT Trusted Launch)
> - **Image**: Ubuntu server 22.04 LTS x64 gen2
> - Use our **existing SSH key**
> - Allow **SSH and HTTP** ports
> - All other settings same as first VM
> - **Disks tab**:
>   - Standard SSD
> - **Networking tab**:
>   - Set to my ***public-subnet***
>  - Enable **Delete Public IP when VM is deleted**
> - The following part allows this VM's NSG to be reusable when we delete it
>   - Select **Advanced network security group**
>    - Create new > **Security group**
>    - Add **inbound rule**, set **Service to HTTP**
>   - Rename network security group to *tech501-farah-sparta-app-allow-HTTP-SSH-3000*
