---
id: kubernetes
title: Kubernetes
sidebar_label: Kubernetes
---

## Resources

- [Understanding k8s yaml structure](https://goo.gl/4WKgjV) (metadata, spec etc)
- [API reference for yaml spec structure](https://goo.gl/BM7gM6) (specific to type)
- [Nice Diagrams of object types](https://goo.gl/WFgbLs)

## Local Installation Kubectl etc

```
KUBECTL_VERSION=1.12.0
rm kubectl || true
curl -LO "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/darwin/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# gcloud tools


# useful for context and namespace switching
brew install kubectx
```


## Go Templates

- [Sprig builtin go template functions](https://goo.gl/iY4aaF)    
