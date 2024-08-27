**Step 1:** Clone the GitHub repo by running the below command

git clone https://github.com/ChandanTeekinavar/flask-mongo_db.git


Step 2: Build the Docker image

docker build -t <dockerHubUsername>/<imageName>:<tag> .


Step 3: Log in to Docker

docker login


Step 4: Push the image to Docker Hub

docker push <dockerHubUsername>/<imageName>:<tag>

