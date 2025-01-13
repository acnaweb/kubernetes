# Kubernetes

## Kubernetes

### To organize

```sh
k api-resources

```

### Services

#### ClusterIP

Comunicação entre os Pods dentro do cluster por `servicename`

#### NodePort

Acesso externo ao cluster mantendo ClusterIP

## Kubectl

### Install

```sh
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
```

~/.bashrc

```sh
alias k=kubectl
```

```sh
source ~/.bashrc
```

### Context 

> * kubectl config use-context <name>
> * kubectl config current-context
> * kubectl config get-contexts
> * kubectl config view
> * kubectl config rename-context <old_name> <new_name>
> * kubectl get pod -A --kubeconfig config
> * kubectl get pod -A --kubeconfig config


### Cluster

> * kubectl config get-clusters
> * kubectl cluster-info
> * kubectl api-resources
> * kubectl get namespaces


### Nodes

> * kubectl get nodes
> * kubectl get nodes -o wide

### Manifest

> * kubectl create -f <manifest_file> --save-config
> * kubectl apply -f <manifest_file>
> * kubectl delete -f <manifest_file>

> * kubectl apply -f src/pod-mongodb.yaml
> * kubectl apply -f src/pod-api.yaml
> * kubectl apply -f src/pod-api-service.yaml
> * kubectl apply -f src/pod-api-ingress.yaml

### Pod

> * kubectl run <pod> --image=<image> --port=<port>
> * kubectl get pods -o wide
> * kubectl delete pod <pod> --force
> * kubectl logs <pod>
> * kubectl describe pod <pod>
> * kubectl exec -it <pod> -- <command>
> * kubectl get pod -l <key>=<value>
> * kubectl get pods --all-namespaces

### Services

> * kubectl get services
> * kubectl get services --all-namespaces
> * kubectl describe service <service>
> * kubectl describe service pod-api-service
> * kubectl delete service 

### Ingress (Reverse Proxy)

- https://github.com/kubernetes/ingress-nginx
- https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

```sh
minikube addons enable ingress
```

```sh
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
```

## AWS

> * aws configure
> * aws sts get-caller-identity
> * aws eks list-clusters
> * aws eks get-token --cluster-name <cluster>
> * aws eks describe-cluster --name <cluster>
> * aws eks update-kubeconfig --region <region> --name <cluster>

## Docker

> * docker login -u <user> 

## Minikube

```sh
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

> * minikube ip
> * minikube service <service> --url
> * minikube service pod-api-service

## Kind

```sh
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.26.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

```sh
cd cluster-kind
kind create cluster --config config.yaml --name devops --kubeconfig config
```

## Pass

> * pass
> * pass init acnaweb

- https://stackoverflow.com/questions/71770693/error-saving-credentials-error-storing-credentials-err-exit-status-1-out

> * gpg --generate-key
> * pass init <generated gpg-id public key>


## Dashboard

- https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy
```

### Hint

```sh
kubectl run ubuntu-pod -it --image ubuntu
```

## Helm

> * helm list
> * helm status <release>
> * helm search hub <chart>

https://artifacthub.io/

### MinIO

https://github.com/minio/operator/


values = https://github.com/minio/operator/blob/master/helm/tenant/values.yaml

```sh
helm repo add minio https://operator.min.io/

helm install --namespace minio-operator --create-namespace \
  minio-operator minio/operator

helm install --namespace minio-home --create-namespace \
  -f ./charts/minio/minio_home_values.yaml \
  tenant minio/tenant  


kubectl -n minio-operator  get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode
kubectl --namespace minio-operator port-forward svc/console 9090:9090
kubectl --namespace minio-home port-forward svc/minio-home-console 9090:9090

helm delete minio-operator --namespace minio-operator
helm delete tenant --namespace minio-home
kubectl delete pvc --all -n minio-home
```

### Airbyte

```sh
helm repo add airbyte https://airbytehq.github.io/helm-charts
helm install --namespace airbyte --create-namespace  \
  -f ./charts/airbyte/values.yaml \
  airbyte airbyte/airbyte --version 0.50.17

helm delete airbyte --namespace airbyte

kubectl delete pvc --all -n airbyte
```

### Hive

```sh
helm repo add data-platform https://khwj.github.io/data-platform-charts
helm install my-hive-metastore data-platform/hive-metastore --version 0.1.2
```

### Spark

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-spark bitnami/spark --version 8.1.6
```

## References

- https://superuser.com/questions/816143/how-to-run-pip-in-non-interactive-mode
- https://docs.pytest.org/en/stable/reference/customize.html
- https://www.activestate.com/resources/quick-reads/how-to-manually-install-python-packages/
- https://kind.sigs.k8s.io/docs/user/quick-start/

