# Kubernetes

## Kubectl


### Hint

kubectl run ubuntu-pod -it --image ubuntu

### Context 

kubectl config use-context <name>
kubectl config current-context
kubectl config get-contexts
kubectl config view
kubectl config rename-context <old_name> <new_name>

### Cluster

kubectl config get-clusters
kubectl cluster-info

### Manifest

kubectl create -f <manifest_file> --save-config
kubectl apply -f <manifest_file>
kubectl delete -f <manifest_file>

kubectl create -f src/mongodb.pod.yaml  --save-config
kubectl apply -f src/mongodb.pod.yaml
kubectl delete -f src/mongodb.pod.yaml
kubectl apply -f src/simple-node-api.service.yaml

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


### AWS

aws configure
aws sts get-caller-identity
aws eks list-clusters
aws eks get-token --cluster-name <cluster>
aws eks describe-cluster --name <cluster>
aws eks update-kubeconfig --region <region> --name <cluster>

### Docker

docker login -u <user> 
dckr_pat_ySqMjaoFX2UNxOtXB1VjFnH8BF0

### Minikube


minikube addons enable ingress
minikube ip
minikube service <service>
minikube service pod-api-service

### Pass

pass
pass init acnaweb

- https://stackoverflow.com/questions/71770693/error-saving-credentials-error-storing-credentials-err-exit-status-1-out

gpg --generate-key
pass init <generated gpg-id public key>
pass init 78AB0E25918FFA7


## References

- https://superuser.com/questions/816143/how-to-run-pip-in-non-interactive-mode
- https://docs.pytest.org/en/stable/reference/customize.html
- https://www.activestate.com/resources/quick-reads/how-to-manually-install-python-packages/

