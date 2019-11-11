---
id: minikube
title: Minikube
sidebar_label: Minikube
---



```
> **WARNING**: Local set up is now done through `docker-compose`
```



## Background

We shall allow the site to be brought up in a production-like environment locally, albeit running on 
minikube in place of k8. It should go some way to verifying our Helm scripts and let us see a little
more closely when we are creating new releases etc

## Postgresql Locally

##### To find out postgres password:

 `k get secret partridge-dev-postgresql -o yaml | grep postgres-password | awk '{print $2}'| base64 --decode`



##### To find out postgres NodePort url:

`minikube service "$(kubectl get service | grep postgres | awk '{print $1}')" --url`



##### To reload postgresql (required to change DB, password, username etc etc)

Delete the pvc, pv, pod, (postgres-password) secret  -> redeploy helm (yarn dev)

## Local Installation/Upgrade Minikube

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  && chmod +x minikube
sudo cp minikube /usr/local/bin && rm minikube
```

## Usage

- Bring up minikube and setup kubectl etc - `./packages/partridge-shell/script/deploying.sh local-env-up --debug`
- Dashboard - `minikube dashboard`
