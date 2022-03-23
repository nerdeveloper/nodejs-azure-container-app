SHELL      = /usr/bin/env bash


.PHONY: config
config:
	gcloud services enable run.googleapis.com

.PHONY: build
build:
	docker build -t us.gcr.io/odirionye/nodejs-containerapp:1 .

.PHONY: push
push:
	docker push us.gcr.io/odirionye/nodejs-containerapp:1

.PHONY: deploy
deploy:
	gcloud run deploy osafrica --image=us.gcr.io/odirionye/nodejs-containerapp:1 --platform managed --allow-unauthenticated --port 3000 --region us-central1
