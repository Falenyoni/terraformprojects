#!/bin/bash

sudo yum update -y
sudo dnf install -y java-11-amazon-corretto-devel wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins