# Jenkin setup

## Jenkins on Kubernetes
 Our initial setup includes a robust Jenkins deployment using Helm charts. This setup leverages a locally built Docker image.

## Install Chart

```console
helm install jenkins -n jenkins -f jenkins-values.yaml jenkinsci/jenkins 
--set-file=controller.JCasC.configScripts.security=./jenkins-casc-configs/security.yaml --set-file=controller.JCasC.configScripts.seed-job-config=./jenkins-casc-configs/seed-job-config.yaml
```

## Uninstall Chart

```console
 helm uninstall jenkins -n jenkins
```