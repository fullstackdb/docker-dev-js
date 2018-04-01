# minikube

 [BACK](./../README.md)
You can start minikube with `minikube start --cpus 8 --memory 4000`

List addons
`minikube addons list`

## Enable these addons

```
minikube addons enable dashboard
minikube addons enable heapster
minikube addons enable ingress
```

To start the dashboard (UI) run:
`minikube dashboard` or just for getting url `minikube dashboard --url`

# Explanation of deploy.sh

## collect function
Function pass the name of file which should be collected as one yaml configuration for 
the kubernetes. for example, collect_yamls "deploy", collect_yamls "expose"
The second argument is a docker image tag which will be used for starting KUNTEYNIR
For example, collect "deploy" $TAG, or collect "deploy" my-tag will replace {app:master} in the deployments to app:my-tag
