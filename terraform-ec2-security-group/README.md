# This is for creating EC2 and its security group

This project demonstrates the creation of EC2 instamnces using terraform and installing jekins and exxposing it to the internet.

First create a security group and security group rules

Attach the security group to your EC2 instance and also make sure the

** After running 
    > terraform approve --auto-approve
1. SSH into the instance and run the below 
    > echo "Initial Jenkins Unlock Key:" 
    > cat /var/lib/jenkins/secrets/initialAdminPassword

2. Get the IP address of the instance and append a colon ad port 8080 at the end and get the password from above and login