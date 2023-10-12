## Terraform 3 Tier Application
* In this project we will create a Three-tier architecture using Terraform.

# WEB Tier
In this tier we will create
1. Two Public Subnets to provision an EC2 Server
2. NAT Gateway
3. An Internet facing load balancer to direct traffic to an autoscaling Group and to be publicly available to the user wen in the web tier, to maintain the application more secure.


# Application Tier
In the Application Tier create:
1. Two Private Subnets backed with
2. an Internal facing Load Balancer that directs traffic to the auto scaling group

# Database Tier
In the database tier, we create:
1. Two Private subnets for the database
2. The database
