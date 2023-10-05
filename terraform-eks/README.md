## WHAT IS EKS?
* EKS is AWS  MANAGED Kubernetes service.
* This means:
✅ AWS manages the control plane
✅ Provisioning/maintaining master nodes
✅ Install Control plane processes
    ☑️ API Server
    ☑️ Scheduler
    ☑️ Controller Manager
    ☑️ etcd 
✅ Scaling and backups 

* Since AWS Has done that for you the only thing you have to worry about is the WORKER NODES



## WHY DO WE USE EKS?
1. Running and Scaling Kubernetes can be difficult doing it on your own
2. Properly securing Kubernetes increases operational overhead
3. Tight integration with other AWS services
    🔴 S3
    🔴 IAM
    🔴 Secrets Manager
    🔴 Load Balancer


## Worker Nodes
** EKS does not manage worker nodes, it is up to you to setup the worker nodes

# Different ways of managing worker nodes
1. Self-managed nodes
2. Managed node group
3. Fargate

## Self-manged Nodes
✔️ Users must provision manually EC2 instances
✔️ All Kubernetes worker processes must be installed
    ✔️ Kubelet
    ✔️ Kube-proxy
    ✔️ Container runtime

✔️ Updates and security patches are the user's responsibility
✔️ Register Node with Control-Plane

## Managed Node Group
✔️ AWS Automates the provisioning and lifecycle management of EC2 nodes
✔️ Managed nodes run EKS optimized images
✔️ Streamlined way to manage lifecycle of nodes using single AWS/EKS API call:
    ✔️ Create
    ✔️ Update
    ✔️ Terminate
✔️ Every node is part of an Auto Scaling group thats managed for you by EKS


## FARGATE
✔️ Follows a serverless architecture
✔️ Fargate will create worker nodes on demand
✔️ No need to provision/ maintain EC2 servers
✔️ Based on container requirements Fargate will automatically select optimal EC2 sizing
✔️ You only pay for what you use


## BENEFITS OF MANAGED Kubernetes services


## Architecture


## steps to Provision Kubernetes Cluster on EKS
1. Creating and EKS Cluster
    ✔️ Cluster name, K8s version
    ✔️ IAM role for cluster
        ✔️ provision nodes
        ✔️ Storage
        ✔️ secrets
    ✔️ Select VPC & Subnets
    ✔️ Define security group for cluster

2. Creating worker nodes
    ✔️ Create Node Group
    ✔️ Select instance type
    ✔️ Define min/max number of nodes
    ✔️ Specify EKS cluster to connect to

3. Connect to cluster
    ✔️ kubectl config set-cluster

## Different Ways to Create Cluster
1. AWS Console
2. EKSCTL
3. IAC - Terraform/ Pulumi


## EKSCTL

