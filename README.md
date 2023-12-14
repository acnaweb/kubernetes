# Kubernetes

## Kubectl

### Context 

kubectl config use-context <name>
kubectl config current-context
kubectl config get-contexts
kubectl config view
kubectl config rename-context <old_name> <new_name>

### Cluster

kubectl config get-clusters
kubectl cluster-info

### Nodes

kubectl get nodes

### Manifest

kubectl create -f <manifest_file> --save-config
kubectl apply -f <manifest_file>
kubectl delete -f <manifest_file>

kubectl apply -f src/pod-mongodb.yaml
kubectl apply -f src/pod-api.yaml
kubectl apply -f src/pod-api-service.yaml
kubectl apply -f src/pod-api-ingress.yaml

### Pod

kubectl run <pod> --image=<image> --port=<port>
kubectl get pods
kubectl delete pod <pod> --force
kubectl logs <pod>
kubectl describe pod <pod>
kubectl exec -it <pod> -- <command>
kubectl get pod -l <key>=<value>
kubectl get pods --all-namespaces

### Services

kubectl get services
kubectl get services --all-namespaces
kubectl describe service <service>
kubectl describe service pod-api-service
kubectl delete service 

### Ingress (Reverse Proxy)


- https://github.com/kubernetes/ingress-nginx
- https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

minikube addons enable ingress

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

### AWS

aws configure
aws sts get-caller-identity
aws eks list-clusters
aws eks get-token --cluster-name <cluster>
aws eks describe-cluster --name <cluster>
aws eks update-kubeconfig --region <region> --name <cluster>

### Docker

docker login -u <user> 

### Minikube

minikube ip
minikube service <service> --url
minikube service pod-api-service

### Pass

pass
pass init acnaweb

- https://stackoverflow.com/questions/71770693/error-saving-credentials-error-storing-credentials-err-exit-status-1-out

gpg --generate-key
pass init <generated gpg-id public key>


### Dashboard

- https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/


kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy

### Hint

kubectl run ubuntu-pod -it --image ubuntu

## References

- https://superuser.com/questions/816143/how-to-run-pip-in-non-interactive-mode
- https://docs.pytest.org/en/stable/reference/customize.html
- https://www.activestate.com/resources/quick-reads/how-to-manually-install-python-packages/

