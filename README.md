# SAMBA server on Kubernetes serving from Google cloud storage buckets 


* create a service account on GCP and give it access to all the buckets that you to mount to Samba server

* connect to your kubernetes cluster 

* create secret for service account file inside k8s API server
`kubectl create secret generic service-account-secret --from-file=./key.json`

* change the bucket names and mounting path inside Dockerfile and setup.sh lines below
`<bucket-name-1>`
`<bucket-name-2>`


* build the container 
`sudo docker build -t gcr.io/<your-project-id>/smb-bucket-server .`

* push it to google cloud container reg
`docker push gcr.io/<your-project-id>/smb-bucket-server`

* change image path and kubernetes config as needed inside k8s.yaml & apply kubernetes config
`kubectl apply -f k8s.yaml`
