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

(Note: All manifest files are configured to deploy in the flask namespace.)


**Step 6:** Apply the ConfigMaps and Secrets:

****kubectl apply -f ConfigMap.yml**

**kubectl apply -f env-configmap.yml**

**kubectl apply -f secret.yml****


