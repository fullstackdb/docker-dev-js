#!/bin/bash
set -ex
cd k8s

kubectl create -f cluster/namespace.yml
kubectl create -f app/deploy.yml
kubectl create -f app/expose.yml
kubectl create -f ingress.yml

