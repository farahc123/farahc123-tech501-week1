# All task steps

## Second VM:

> - **Name**: tech501-farah-first-deploy-app-vm
> - **Security type**: Standard
> - **Disk image**: Ubuntu Server 22.04 LTS x64 Gen2
>
>- All other settings default
>
>- Use existing key (select it)
>
>- Allow SSH and HTTP  ports
>
>- **Disk tab**: Standard SSD
>
>- **Networking** tab:
    - Set to your  public subnet
>  - The following allows the Network Security Group to be reusable when we delete this VM
>       - Select **ADVANCED** network security group
>       - Create new under Security Group
>       - Add inbound rule, set Service to HTTP 
>       - Rename network security group to tech501-farah-sparta-app-allow-HTTP-SSH-3000
>       - Back in networking tab, enable delete Public IP
