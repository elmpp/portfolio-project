---
id: gcloud
title: Google Cloud
sidebar_label: Google Cloud
---

> Google Cloud here refers to GCP (non-GKE cloud estate)

## Resources

- What is a "Service Account" - http://tinyurl.com/y3apktz8

- Console page for all IAM accounts - http://tinyurl.com/y57qmkyx

## Important values

See here - https://tinyurl.com/y634xgz2

| Property       | Value          |     |
| -------------- | -------------- | --- |
| Project ID     | partridge-alan |     |
| Project number | 701251931769   |     |
|                |                |     |

## Manual Setup Steps

- Creating the project etc within console

- Google Cloud Source Repository setup to sync with Github (required to allow Build Triggers) - http://tinyurl.com/yympqcl6 . 

  *connect via the normal user "elmpp / matthew.penrice@gmail.com"*

- Create service accounts (@see below)

- Cloud Run verify domain name: https://tinyurl.com/yyz4mkqe

- 

## Service Accounts IAM etc

| Email                                                      | Notes                                                                                                                                                                     | Key <br/>(if external - http://tinyurl.com/y2w3bzmp )                          | Enabled?                                | Link                         |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------:| --------------------------------------- | ---------------------------- |
| gcr-pull@partridge-alan.iam.gserviceaccount.com            | Added to the eu.artifacts.partridge-alan.appspot.com bucket as a "Storage Object Viewer". This is to enable pulling of GCR by minikube. More info - https://goo.gl/8FtPyG | -                                                                              | DISABLED                                |                              |
| 701251931769-compute@developer.gserviceaccount.com         | Created when project created. Should not be used externally                                                                                                               | ~/Google\ Drive/Partridge/keys/partridge/serviceaccount-privatekey-latest.json | [DEFAULT]()https://tinyurl.com/yyw2zzfj |                              |
| partridge-logging@partridge-alan.iam.gserviceaccount.com   | @see below for example setup                                                                                                                                              | packages/containers/etc/service-accounts/serviceaccount-partridge-logging.json | ENABLED                                 | https://tinyurl.com/y5qeuxc2 |
| partridge-cloud-sql@partridge-alan.iam.gserviceaccount.com | Cloud SQL Proxy credentials file                                                                                                                                          | packages/containers/etc/service-accounts/serviceaccount-cloud-sql.json         | ENABLED                                 |                              |
| 701251931769@cloudbuild.gserviceaccount.com                | Cloud Build service account                                                                                                                                               | -                                                                              |                                         |                              |
| 701251931769-compute@developer.gserviceaccount.com         | Cloud Run service account                                                                                                                                                 | -                                                                              |                                         |                              |

#### Creating Service Accounts

Service accounts facilitate access to GCP [resources](https://tinyurl.com/y2kooc7g). All communication within GCP is done via a service account. Keys can be exported that allow external processes to act as them.

A good example of when to create one is the logging library `partridge-logging`...

```
# creates the service account - https://tinyurl.com/y3r3u4gm
gcloud beta iam service-accounts create partridge-logging \  
--description "Allows stackdriver logging writing" \   
--display-name "partridge-logging"

# adds role for writing to stackdriver (roles list here - https://tinyurl.com/y632ya7c)
gserviceaccountaddrole serviceAccount:partridge-logging@partridge-alan.iam.gserviceaccount.com roles/logging.logWriter
gserviceaccountaddrole serviceAccount:partridge-logging@partridge-alan.iam.gserviceaccount.com roles/monitoring.metricWriter

# shows roles have been added ok - https://tinyurl.com/y5zexak6
gserviceaccountroles partridge-logging@partridge-alan.iam.gserviceaccount.com
```



#### Creating API Keys

API keys are for cases when GCP access is required for a client device and not running in the cloud. An example of this is the error-reporting client side library within `partridge-logging`

To create them, follow this guide - https://tinyurl.com/y5zgrn6q



#### Downloading Service Account Keys

```
# described here - https://tinyurl.com/y6frl9bg
gcloud iam service-accounts keys create ~/Google\ Drive/Partridge/keys/partridge/serviceaccount-partridge-logging.json \
--iam-account partridge-logging@partridge-alan.iam.gserviceaccount.com
```
