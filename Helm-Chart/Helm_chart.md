What is Helm Chart?

- Basic Building Block is the Docker Container
- Docker Container helps package any aplication e.g python appllication, java application etc
  -You can then ship the conatiner to anywhere or deploy to a Prod environment

Helm Chart provides a top layer abstraction so that you can run a minimal helm chart command which can internally communicate with our kubernetes cluster and can produce same results in a more efficient way.

# Kubernetes As a Service

1. AKS - Azure Kubernetes Services
2. EKS - Elastic Kubernets Service
3. GKE - Google Kubernetes Engine
4. microK8s - Free

## SET UP microK8s on Mac M1

1. Install microK8s

   - Go To https://microk8s.io/#install-microk8s
   - Select which OS you installing for and follow instructions
     ** brew install ubuntu/microk8s/microk8s
     ** microk8s install

2. Install kubectl on mac M1
   - Go to https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/
   - curl -LO "https://dl.k8s.io/release/v1.28.2/bin/darwin/arm64/kubectl"

## How to Install Helm chart

# Pre-requisites
_ One running kubernetes cluster (any of the following)
a. EKS - Amazon Elastic k8s Service
b. GKE - Google k8s engine
c. AKS - Azure Kubernets Service
d. microk8s - k8s for development

# Installation of Helm Chart
_ Go to https://jhooq.com/getting-start-with-helm-chart/

## HELM ARCHITECTURE

<p align="center">
  <img src="helm.png" width="350" title="Helm Architecture">
</p>

## Helm CLI(Commands)

* Basic Helm CLI Commands
    * helm install myhelloworld helloworld
    * helm delete myhelloworld
    * helm list -a
