# Kubernetes

```sh
export KUBE_EDITOR=nano
```

## Kubernetes

### To organize

```sh
k api-resources
k get po <podname> -o yaml
k get svc <svcname> -o yaml
k apply -f <file.yaml>
```

### Explain

```sh
k explain deployment
k explain deployment.spec
k explain deployment.spec.template
```

### Rollout

```sh
k rollout 
```

### Deployments

```sh
k create deployment --image httpd httpd
k get deploy
k get deploy httpd -oyaml | k neat >> deployments/nginx-deploy.yaml
k create deployment --image httpd httpd --dry-run -oyaml | k neat >> deployments/nginx-deploy1.yaml
k delete deploy httpd
k create deployment --image httpd httpd --replicas 3
k edit deploy httpd
k get deploy --show-labels
k get deploy --show-labels
```

### Replicasets

```sh
k get rs
```

### Config

```sh
# set default
k config set-context --current --namespace devops
k config set-context --current --namespace default
```

### Namespaces

```sh
k get ns
k create ns devops 
k delete ns devops
k get po -n devops

# simulate 
k create ns devops --dry-run=client -oyaml | k neat
```

### Logs

```sh
k logs -n default nginx
k logs muticontainer-pod -c httpd
k logs muticontainer-pod -c debug
```

### Exec

```sh
k exec -it muticontainer-pod -c httpd -- sh
k exec -it muticontainer-pod -c debug -- sh

# mesmo host
k exec muticontainer-pod -c httpd -- hostname
k exec muticontainer-pod -c debug -- hostname
```

### Pods

```sh
k run -it --rm --image alpine server sh
k run -it --rm --image ubuntu server sh
k run --image hashicorp/terraform terraform --dry-run -oyaml | k neat > pods/terraform.yaml
k exec -it terraform -- sh
k get po -w 
k get po -l app=httpd
```

### Init Container

> * Dica: 
> * nslookup <url indisponível>
> * echo $?  # verificar código de retorno


```sh
k run -it --rm --image busybox busybox sh
until nslookup mysqlserver.default; do echo "Trying to connect"; sleep 1; done
```

```sh
k apply -f pods ngnix-sidecontainer.yaml
k logs nginx-init-container 
k logs nginx-init-container -c waitfordns
```

```sh
k create service clusterip mysqlserver --tcp=80:80
k delete service mysqlserver
```

## Hint

### Krew

- https://krew.sigs.k8s.io/

## References

- https://superuser.com/questions/816143/how-to-run-pip-in-non-interactive-mode
- https://docs.pytest.org/en/stable/reference/customize.html
- https://www.activestate.com/resources/quick-reads/how-to-manually-install-python-packages/
- https://kind.sigs.k8s.io/docs/user/quick-start/

