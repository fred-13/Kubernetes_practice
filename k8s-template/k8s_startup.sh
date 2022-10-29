#!/bin/bash

minikube start --kubernetes-version=v1.25.2 --driver=kvm2
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
kubectl create ns ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx
kubectl patch svc -n ingress-nginx ingress-nginx-controller -p {spec:{externalIPs:["$(minikube ip)"]}}
helm repo add jetstack https://charts.jetstack.io
kubectl create ns cert-manager
helm upgrade --install cert-manager jetstack/cert-manager  --namespace=cert-manager
helm repo add harbor https://helm.goharbor.io
helm install harbor harbor/harbor --namespace harbor
kubectl get secrets -n harbor -l owner=helm
