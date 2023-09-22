## IAC approach benefits
* Boosts productivity through automation
* Consistency in configuration and setup
* Minimising risk of human error
* Accountability
* Documentation
* Enhanced Security

## There are many IaC tools Available
1. Cloudformation
2. AWS CDK
3. Terraform
4. Pulumi
5. Ansible(but be careful)

## To What extent do you need automation?
* You can deploy EKS with AWS console or with `eksctl`
* You can add most of the charts as YAML manifests or with Helm
* You need to adjust Security Groups, create IAM roles, bind Service Accounts to the Roles
* You might need to create self-managed nodegroups

* and then you need to maintain it.. or recreate it in another region...


#WHAT Is EKS blueprints
* EKS Blueprints helps you configure complete EKS clusters that are fully bootstrapped with the operational software that is needed to deploy and operate workloads.
* It's available as Terraform module and as CDK module.