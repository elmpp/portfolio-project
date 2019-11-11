---
id: helm
title: Helm
sidebar_label: Helm
---

```
> **WARNING**: Local set up is now done through `docker-compose`
```



Helm is what will constitute our releases and
represent our application packaged as a deployable on Kubernetes.

## Resources

- [Official Docs](https://docs.helm.sh/using_helm/#quickstart-guide)
- Offline Docs. Link: file:///Users/matt/dev/docs/helm/docs/

## Installation (client)

```shell
brew install kubernetes-helm
helm repo update
```

## Installation (minikube)

```shell
# ensure we're talking to minikube
kubectl context set-context minikube
helm init --kube-context=minikube
```

## Installation (GKE)

## Usage

```

```
