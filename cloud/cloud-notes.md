# Cloud notes

> ## [For Sparta: see important rules about use](https://teams.microsoft.com/l/entity/com.microsoft.teamspace.tab.planner/tt.c_19:TrpQwMO1PhqN7mR8x3SAhj2rcRGRLydw29ZVM26z2m01@thread.tacv2_p_rzzvyNukM0GzIMpb8EjAVJYAD4Ih_h_1736761296374?tenantId=ff15c67c-2870-4e9f-adc1-7d61d855b667&webUrl=https%3A%2F%2Ftasks.teams.microsoft.com%2Fteamsui%2FpersonalApp%2Falltasklists&context=%7B%22subEntityId%22%3A%22%2Fv1%2Fplan%2FrzzvyNukM0GzIMpb8EjAVJYAD4Ih%2Ftask%2FiqUxoyhSfUu-MTXos5X1yZYAA60s%22%2C%22channelId%22%3A%2219%3ATrpQwMO1PhqN7mR8x3SAhj2rcRGRLydw29ZVM26z2m01%40thread.tacv2%22%7D)

- [Cloud notes](#cloud-notes)
  - [What is the cloud?](#what-is-the-cloud)
  - [Levels of service (SLAs)](#levels-of-service-slas)
  - [Cloud providers](#cloud-providers)
  - [Resources that can be hosted in the cloud](#resources-that-can-be-hosted-in-the-cloud)
  - [SSH key-pairs](#ssh-key-pairs)
- [Creating resources](#creating-resources)
  - [Relevant Git commands](#relevant-git-commands)


## What is the cloud?

- Broadly speaking, a pay-as-you-go computing service available over the Internet (though the private cloud isn't)
- **Advantages**:
  - Offers **scalable capacity** to create resources 
  - Everything is **centrally managed and accessed**
  - More **secure**
  - **Improved collaboration**
  - for start-ups and small businesses, the cloud **offers tools** that they wouldn't otherwise have access to on-prem
- **Disadvantages**:
  - Depends on the Internet
  - Possibly requires staff upskilling/culture shift 
- The cloud is hosted by **cloud providers**
- **Differences between on-prem and the cloud**:
  - On-premise resources are hosted on hardware you own/rent, whereas cloud resources are hosted by a provider
  - You often have less control and thus less responsibility over resources in the cloud (to varying extents, depending on level of service)
- OpEx vs. CapEx:
  - the initial investment costs for migrating to the cloud vs. the day-to-day costs in running it
  - CapEx is typically lower with cloud than on-prem whereas OpEx is higher with cloud, though it's still pay-as-you-go
  - Companies may choose to pay upfront (OpEx) on some things because it offers them a discount
- **Is migrating to the cloud always cheaper?**:
  - No, but it depends on the business and what they would use in the cloud (also if they have cloud-skilled staff) vs. what they have on-prem (also the utilities this costs)
  - These costs can be calculated using tools like Azure's **Total Cost of Ownership** calculator
  - for many businesses, being on-prem is cheaper
  - But higher cloud costs can be balanced with **viewing it as an investment** in some cases, e.g. compliance, future-proofing, may offer more security
- The 4 pillars of DevOps & how they link into the cloud:
  - Continuous Integration (CI)
  - Continuous Delivery (CD)
  - Infrastructure as Code (IaC)
  - Monitoring and Logging 
  - **all use the cloud to execute tasks or generally to maintain connections with remote machines to perform them**
- **Models**:
  - **Private cloud**: computing environment for one org only; more secure because it offers more control over data & infrastructure
  - **Public cloud**: managed service providers manage the cloud for you, so usually less control/responsibility
  - **Hybrid**: prioritised use of private and public
  - **Multi-cloud**: using multiple cloud service providers for more reliability (this approach to having backup services is known as **redundancy** and it's a good thing)

## Levels of service (SLAs)

-   Depending on the cloud service, you have a **different level of control** (and thus **responsibility**) over security (also different costs)
-   These are defined in **SLAs**: service-level agreements
-   The cloud **isn't necessarily safer** than on-premises — it depends on the level of service you choose
-   Options:
    -   **IaaS**: raw IT resources; offers wide scope of scalability; almost entirely **customisable**; e.g. **AWS**
    -   **PaaS**: platform that gives devs an environment to deploy code; step down from infrastructure; e.g. **SAP**
    -   **SaaS**: lowest level of service; most popular service because of its simplicity, e.g. Zoom, Salesforce
-   **Middleware**: the extra things that need to be installed/configured (e.g. packages or libraries) to communicate between your code and OS
-   **Runtime**: software/instructions executed while a programme is running

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfRJTJKPnLAB0_CWu3zI245KwGG7yxqV-OZ1_oVUNlYrxSDf4A0wPZ1JFPPmj4AtKoX2Y3atjXLZHtZIynhoCBSBhNzIyPPIRVtqoHE1IPCUwCKApOb_OlsEMoDR-stWkwbVbsKMA?key=ZjUPLKZKfymu-3IgqyURTpfE)

## Cloud providers

-   AWS has biggest market-share; then Azure, then GCP

-   Azure is helped by being Microsoft-owned, so it seamlessly integrates with that ecosystem, e.g. Microsoft 365 users just need permissions adding to Azure

-   Harder to find GCP talent so salaries can be higher
  <br>
  <br>
![alt text](image.png)

## Resources that can be hosted in the cloud

-   **Compute** resources:

    -   Virtual machines

-   **Network** resources:

    -   Virtual networks (e.g. Azure's VPC)

-   **Databases**

-   **Object storage**, e.g. AWS S3 or Azure Blob Storage

## SSH key-pairs

-  You can connect to a remote machine/the cloud etc. using an **SSH key-pair**, which, once created, is found in the ***.ssh*** sub-directory in the local machine's **home directory** (i.e. ***~/.ssh***)
-  This key-pair contains a **public and private key**, which are used as secure access credentials when connecting to a remote machine etc.
-  Think of the public key as the padlock, and the private key as the key itself
-  SSH connects via **port 22**
-  Elements of SSH key-pair:
   -  **Public key** (i.e. padlock): this is `cat`ed and pasted to the machine on the cloud platform, e.g. into the *Upload key* field on Azure's *Create an SSH key* page after selecting *Upload existing public key*
   -  **Public key path**
   -  **Private key** (i.e. key itself): this is almost **always** kept private; pasted **only to trusted services** e.g. Jenkins when we want to use it to connect to a VM
   -  **Private key path**: this is given to other trusted resources, e.g. when natively connecting to a VM on Azure
-  The **private** SSH key PATH (not the actual encrypted key itself) is shared with a server you want to access
-  to "SSH into" a machine essentially means to log into it
-  To create an SSH key-pair on local machine:
   -  ***ssh-keygen <parameters>*** — this creates a private and public key pair (1 of each; private needs to be kept private) — note that when setting keypair names, don't use backspace as this will introduce weird characters into the name
   -  so far, we haven't applied any passphrases to our key-pairs
   -  e.g. `ssh-keygen -t rsa -b 4096 "username@gmail.com"` creates an RSA key-pair of 4096 bits and uses an optional comment containing email address to identify owner

# Creating resources

-   When creating a resource, it's good practice to end it with the resource name e.g. "*farah-vnet*" or "*app-vm*"
-  When doing something architecturally on the cloud, plan it out first
-   Virtual machines in public subnets can have a **public IP address** (via its NIC card) if you want to communicate from outside the v-net, as well as a **private IP address** for communication within the virtual network
-   Virtual machines need to live in a **subnet** on a **virtual network**

## Relevant Git commands

-   `ssh-keygen <parameters>` — this creates a private and public key pair (1 of each; private one needs to be kept private)
  - adds algorithm (set using -t and specifying algorithm), key size (set using -b and bit size), and optional comment (we're using an email)
    -    e.g. `ssh-keygen -t rsa -b 4096 "username@gmail.com"` 
   -   note that when setting keypair names, **don't backspace** as this will introduce weird characters into the name
    
