## How to create your Own Custom Helm Chart
The following are what we are going to do:
1. create Application with Rest API
2. Create Docker Container
3. Push Docker Image to docker repository
4. Create Helm Chart for Python Rest API app
5. Install the Helm Chart
6. Verify The Helm Chart After installation

# Use the following repo for the application
> https://github.com/Falenyoni/python-flask-rest-api-project-helm
1. Clone the repository to your local machine
    > git clone https://github.com/Falenyoni/python-flask-rest-api-project-helm
2. Go inside the repository
    > cd python-flask-rest-api-project-helm
3. You can test the application by running the following command
    > python3 main.py
    ** If it complains about flask make sure you install the flask library
    > pip install flask
    ** when it starts running on your local machine browser navigate to
        > http://127.0.0.1:9001/hello
        > it will display the json result as {"data":"Hello World"}
4. Build a docker image and push to your repository
    * Check the Read Me In the cloned repository for instructions

5. Once the above steps have been carried out successfully, create you helm chart
    a. helm create <chart_name>
    b. Edit the Chart.yml file
        > vi Chart.yml
        * Comment out the appVersion and save
    c. Edit the values.yml file
       > vi values.yml
       * Edit the repository and specify your docker hub repository for your image and tag
       * Also change the service to NodePort
    d. Finally edit the templates/deployment.yml file
        > vi deploy.yml
        * Specify the correct port
        * Comment out the probs in this case
        * also remove the appVersion as it was commented out above
        *save file
6. Install the helm chart
   > helm install <release_name> <helm_chart_project_name>

7. Verify if everything is working

a. Get the application URL by running these commands:
   1. export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services mypythonhelmchart-python-flask-rest-api-project)
   2. export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
   3. echo http://$NODE_IP:$NODE_PORT

b. Show the installed Helm chart
> helm list -a

c. Check deployment
> kubectl get deployments

d. Check service and Port and Service Type
> kubectl get service

Navigate to the echoed url i step 7a3 above(make sure on export in 7a1 you use the correct service name)