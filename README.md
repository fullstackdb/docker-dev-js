# how to run the node container

Be sure that you have installed docker

Run 
`make build` - this command create a image

By default, the image will have this name `nddev:<commit hash>`

You can override this behaviour by running command with arg:

`make build tag=<specify the name>`
It produces the name `nddev:<name>`

There are two predefined variants how to run that container:

`make run` and `make run-shell`

First just start nodemon as usual and watches changes
Second attach the shell (you can run commands inside container)


The folder `src` is attached to the container

## Minikube

[Minikube](./docs/minikube.md)

# How to check in the minikube
```
eval $(minikube docker-env)
make build
make infra
make deploy-all
```
Check load-balancer

```
make loadbalancer-info
```

Also supports remote debugging from minikube (I GUESS SHOULD)