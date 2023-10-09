## Public vs Private Services

** AWS services can be categorised into two main types
1. Public Services
2. Private Services

*** PUBLIC and PRIVATE Services - Refers to Networking Perspective only

* A public Service is something which is accessed using public end points eg
    1. Simple Storage service S3

* A Private AWS service is something which runs within a VPC.

## 3 different Network Zones
1. Public Internet Zone
    ✔Direct access to internet services eg gmail, online shops
    ✔ Access Public AWS using INTERNET as transit
2. AWS Public Zone
3. AWS Private Zone 
    ✔ VPC's are isolated unless configured otherwise
    ✔ On-Premises can access VPC's only if configured via VPN or Direct Connect


## AWS Global Infrastructure

** The two types of deployment at this Global level are:
1. AWS Regions 
2. AWS Edge Locations

* Regions offer 3 main benefits
1. Geographic Separation - Isolated Fault Domain
2. Geopolitical Separation - Different governance
3. Location Control - perfomance


## Service Resilience
* Resilience level of a service is described in the following 3 ways
1. Global Resilient - product data is replicated across multiple regions inside AWS eg IAM, Route 53
2. Region Resilient - replicate to multiple AZ's in a Region
3. AZ Resilient


## Virtual Private Cloud (VPC)
* VPC - Is a service you will use to create private networks inside AWS that othe private services will run from
* They are also the service which is used to connect your AWS private networks to your on-premises networks when creating a hybrid environment
* Or its the service which lets you connect to other cloud platforms, when you creating a multi-cloud deployment
* A default VPC is created once per Region when an AWS Account is first created
* There can only be one default VPC per region, they can be deleted and recreated from the console UI
* They always have the same IP range and the same "1 Subnet per AZ' architecture

** AVPC  = A Virtual Network inside AWS
** AVPC is within 1 account & 1 region
** VPC's are regionally resilient
** VPC's operate from multiple Availability Zones in a specific AWS region
** VPC by default is PRIVATE and Isolated unless you decide otherwise
        ** Services deployed into the same VPC can communicate 
        ** But the VPC is isolated from other VPC's and from the public AWS Zone and the pubblic Internet
** There are two types of VPC's available in AWS
    1. Default VPC and Custom VPC's
    *There is a maximum of 1 default VPC per region

## Default VPC Facts
1. One per Region - can be removed and recreated
2. Deafault VPC CIDR is always 172.31.0.0/16
3. /20 Subnet in Each AZ in the region
4. Intenet Gateway(IGW), Security Group(SG) and NACL
5. Subnets assign public IPv4 addresses

## Elastic Compute Cloud (EC2)
* EC2 provides access to virtual machines known as instances

### EC2 Key Facts and Features
1. IAAS - Provides Virtual Machines => Instances
2. Private service by-default - uses VPC networking
3. EC2 is AZ Resilient - Instances Fails if AZ fails
4. Different instance sizes and capabilities
5. On-Demand Billing - Per Second
6. Local on-host storage or Elastic Block store(EBS)

Instance Lifecycle

Instance state influences the charges 
1. Running
2. Stopped
3. Terminated

** Storage is still allocated in Running or Stopped State
** You will see charges on your bill for EBS Storage even if the instance is stopped


## Amazon machine Image(AMI)
** As the name suggest its an image of an EC2 instance
** An AMI can be used to create an EC2 Instance or
** An AMI can be created from An EC2 Instance

# An AMI Contains a few important things to be aware of
1. Attached Permissions - These permissions controll which accounts can or cannot use the AMI
    * The AMI can be set as a PUBLIC AMI - in which case EVERYONE is allowed to launch instances from the AMI.
    * The Owner of an AMI is implicitly allowed to create EC2 instances from the AMI.
    * You can Add Explicit Permissions - specific AWS accounts Allowed

2. Root Volume
3. Block Device Mapping - This is a configuration which links the volumes that the AMI has and how they're presented to the OS.
    * It determines which volume is the boot volume and which volume is the data volume

