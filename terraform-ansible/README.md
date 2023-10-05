## Ansible Notes

** Automation -> Is the technique of making an apparatus, a process, or a system operate automatically."

# What is ANSIBLE
* Ansible is a radically simple IT automation engine thatautomates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs"

WHY ANSIBLE?
1. Ease of use
2. Auto repeat
3. Easy Collab
4. AGENTLESS

Automate
* Deploy apps
Manage systems
Crush complexity

ACCELERATE
* Solve Problems


##
You can use any client to SSH into the ANSIBLE maSTER NODE 

##iNSTALL aNSIBLE IN liNUX 2
> sudo amazon-linux-extras install ansible2

## Copy the key pair file you used to create your nodes to the Master NOde and Add it to the ssh-agent
In master go to the home folder
cd /home/ec2-user

Create a keyfile and copy the contents of your key-pair you used when creating an EC2 instance.

## ADDING The key-par to SSH AGENT IN MASTER
>ssh-agent bash
>cp ec2-key.pem ~/.ssh/
>ssh-add ~/.ssh/ec2-key.pem


#Default Inventory File 
* you can edit the hosts file below and add your servers hear.
> /etc/ansible/hosts

#ADD Your Nodes to your Invetory file
* Add to your inventory File below lines
>ansible-target-1 ansible_host=3.237.224.95 ansible_connection=ssh ansible_user=ec2-user
>ansible-target-2 ansible_host=3.226.241.122 ansible_connection=ssh ansible_user=ec2-user

## Grouping nodes so that you automate a group
* Add to your inventory File below lines
>[servers]
>ansible-target-1 ansible_host=<Node_IP_Address> ansible_connection=ssh ansible_user=ec2-user
>ansible-target-2 ansible_host=<Node_IP_Address> ansible_connection=ssh ansible_user=ec2-user



#Test Connection
>ansible ansible-target/group_tag -m ping -i inventory.txt

** When running the above command it will always require manual intervention to authenticate to the NODES
** Ways to automate this using
1. > export ANSIBLE_HOST_KEY_CHECKING=False
2. > cat /etc/ansible/ansible.cfg and uncomment 
        #host_key_checking =  False


## Language for Playbooks
**THe playbooks we write in Ansible are a combination of tasks that we want to accomplish or execute on the servers or virtual machine
** The playbook itself is a written set of instructions
** We write a playbook with YAML


##Ansible Modules
What is an ansible module
* Modules (also refered to as "task plugins" or library plugins") are discrete units of code that can be used from the command line or in a playbook tasks

ANSIBLE:
    * Executes each module on the remote target node.
    * Collects return values


##Pattern##
> ansible <pattern_goes_here> -m <module_name> -a <arguments>
A. > ansible webservers -m service -a "name=httpd state=restarted"

        #YAML FORMAT
        ```
        - name: restart webserver
          service:
           name: httpd
           state: restarted
        ```


* A pattern usually refers to a set of groups(which are sets of hosts) - in the above case, machines in the "webservers" group

B. ansible webservers -m ping 

C. ansible webservers -m command -a "/sbin/reboot -t now"


        #YAML FORMAT
        ```
        - name: reboot the server
          action: command /sbin/reboot -t now
        ```

        OR
        
        #YAML FORMAT
        ```
        - name: reboot the server
          command: /sbin/reboot -t now
        ```


##Arguments
* Most modules take key=value arguments, space delimited
* Some modules take no arguments
* Command/Shell modules simply take the string of the command you want to run.



Example Play Book

* Install_playbook.yml
Steps
1. Install Nginx on EC2
2. Start Nginx Service
3. Enable Nginx Service
4. Grep Nginx Version
5. Check  Nginx Service Status

install-nginx.sh
``
yum update -y
amazon-linux-extras install nginx1.12
nginx -v
systemctl start nginx
systemctl enable nginx
``

install_nginx.yml
# install Nginx using Ansible

- name:



## Ansible Variables
* A variable is a symbol which works as a placeholder for expression or quantities that may vary or change

** Ansible uses variables to manage differences between systems.
** With Ansible you can execute tasks and playbooks on multiple different systems with a single command
** You can define these variables in your playbooks, in inventory, in re-usable files or roles or at the command line