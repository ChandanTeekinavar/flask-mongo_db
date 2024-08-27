**Step 1:** Clone the GitHub repo by running the below command

**git clone https://github.com/ChandanTeekinavar/flask-mongo_db.git**


**Step 2:** Build the Docker image

**docker build -t <dockerHubUsername>/<imageName>:<tag> .**


**Step 3:** Log in to Docker

**docker login**


**Step 4:** Push the image to Docker Hub

**docker push <dockerHubUsername>/<imageName>:<tag>**


**Step 5:** Create the namespace

**kubectl create ns flask**

(**Note:** All manifest files are configured to deploy in the flask namespace.)


**Step 6:** Apply the ConfigMaps and Secrets:

**kubectl apply -f ConfigMap.yml**

**kubectl apply -f env-configmap.yml**

**kubectl apply -f secret.yml**


**Step 7:** Deploy the StatefulSet for MongoDB

**kubectl apply -f statefulset.yml**

**Note:** I have used the storageClass for persistence. The name of the storage class in my cluster is "standard". If your cluster uses a different storage class or if you want to use a different one, adjust storageClassName: standard accordingly.

**Step 8:** Apply the service manifest to expose the MongoDB pod

**kubectl apply -f mongo-service.yml**


**Step 9:** Deploy the Deployment for the Flask application

**kubectl apply -f deployment.yml**


**Step 10:** Apply the service manifest to expose the Flask pod:

**kubectl apply -f service.yaml**


**Step 11**: Apply the HorizontalPodAutoscaler

**kubectl apply -f hpa.yml**


**Note:** To scale the application based on the given resources, Kubernetes needs a metrics server. First, ensure the metrics server is installed in your cluster. You can check in the kube-system namespace. If the metrics server is not installed, use the following command to deploy it:

**kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml**

This will deploy the metrics server in the kube-system namespace, enabling Kubernetes to monitor resources and scale accordingly.




**Accessing the Application:**
You can access the application at **localhost:5000**


To make a POST request:

  ** For Linux and MacOS  
     **curl -X POST -H "Content-Type: application/json" -d '{"sampleKey":"sampleValue"}' http://localhost:5000/data**

  ** For Windows:

     **Invoke-WebRequest -Method POST -Uri http://localhost:5000/data -ContentType "application/json" -Body '{"sampleKey":"sampleValue"}'**


Then, you can access the /data endpoint.


**Note:** First, you need to port forward the application pod before sending the POST request.




