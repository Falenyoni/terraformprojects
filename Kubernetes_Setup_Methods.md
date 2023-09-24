# Leaning Setup

1. Minikube
2. Kind
3. microK8s

# Production Setup

1. kubeadm
2. kops (AWS)
3. Kubespray 

# Kubernetes As a Service

1. AKS - Azure Kubernetes Services
2. EKS - Elastic Kubernets Service
3. GKE - Google Kubernetes Engine
4. microK8s - Free

### Steps in Setting up EKS using AWS Console

1.  Launch an EC2 instance (EKS Bootstrap)
2.  Install AWSCLI latest version

    - Go to https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    - curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    - unzip awscliv2.zip
    - sudo ./aws/install

    ## Check CLI version

    - /usr/local/bin/aws --version

3.  Setup kubectl

    - Download kubectl latest version
    - Go to https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

    # Steps

        a. curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
            or
            curl -LO https://dl.k8s.io/release/v1.25.2/bin/linux/amd64/kubectl
        b. Grant execution permissions to kubectl executable
            * chmod +x kubectl
        c. Move kubectl onto /usr/local/bin
            * mv kubectl /usr/local/bin
        d. Test that the kubectl installation was successful
            * kubectl

4.  Setup eksctl

    - Download eksctl latest version
    - Go to

    # Steps

        a. Download and extract the latest release
            * curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
                or
            * curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

        b. Move the extracted binary file to /usr/local/bin
            * sudo mv /tmp/eksctl /usr/local/bin

        c. Test that the eksctl installation was successful
            * eksctl version

5.  Create an IAM Role and Attach to the EKS Bootstrap Instance

    - Create an IAM Role and attache it to EC2 instance
      **NB create IAM user with programmatic access if your bootstrap system is outside of AWS \***
      #IAM User should have access To:
      1. IAMFULLAccess
      2. EC2FULLAccess
      3. VPCFULLAccess

    4.  CloudFormationFullAccess

        attach the below custom Policy as well(ekscustom)
        {
        "Version": "2012-10=17",
        "Statement: [
        {
        "Sid": "eksadministrator",
        "Effect": "Allow",
        "Action": "eks:*",
        "Resource": "*"
        }
        ]
        }

6.  Create the Cluster
    - eksctl create cluster --name test-cluster --region us-east-1 --node-type t2.small \
7.  Validate the cluster

    - eksctl get cluster --region us-east-1
    - kubectl get nodes

8.  Create deployment and Service in the Cluster

    - kubectl create deployment tomcat-deployment --image=tomcate:8.0
      - kubectl get deploy
      - kubectl get pod
      - kubectl get pod -o wide

    # To access this application from the outside world create a service

    # Create a service type.

    # A service type can be:

        1. Cluster Ip
        2. Load Balancer
        3. External Name

    # Expose deployment via a loadbalancer

    - kubectl expose deployment tomcat-deployment --port=8080 --type=LoadBalancer
        * kubectl get service -o wide
    - To access your application loadbalancerendpoint:8080

9.  Delete the cluster
    - eksctl delete cluster <cluster_name> --region <region_name>
    - eksctl delete cluster test-cluster --region us-east-1
