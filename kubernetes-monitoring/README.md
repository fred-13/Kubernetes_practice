```
$ minikube start --driver=kvm2 --memory 4096 --cpus 4
$ kubectl create ns nginx && kubectl apply -f nginx.yaml
$ kubectl create ns monitoring
$ helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
$ helm repo update
$ helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring
$ kubectl apply -f ServiceMonitor.yaml
```
