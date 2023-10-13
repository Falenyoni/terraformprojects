# What is a Helmfile and why we need to use it

* Used to manage your releases
eg When using helm to install and uninstall a release you use two commands
> helm install <release_name> <helm_chart_project_name>
> helm uninstall <release_name>

with helm file you use one
> helmfile sync

## HELMFILE STRUCTURE
```
releases:


  - name: helloworld ------------> release name
    chart: ./helloworld --------> Name of helmchart
    installed: true -------------> Set true for install if flag is set to false it will uninstall the chart

## Installation of HELM File
1. On Mac M1.
    > brew install helmfile
2. Others follow https://jhooq.com/helmfile-manage-helmchart/#1-how-to-install-helmfile-and-running-docker-container-of-helmfile


### Use GitHub repository for installing helm chart using Helmfile
** The one more feature of Helmfile which I like the most is - you can even install the helmchart from remote repository such as GitHub, Google Container Repository, AWS ECR
## You can use helm file from a remote repository
** You need to install helm-git



