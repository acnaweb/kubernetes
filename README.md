# Kubernetes

## Kubernetes

### To organize

```sh
k api-resources
k get po <podname> -o yaml
k get svc <svcname> -o yaml
k apply -f <file.yaml>
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

```

### Pods

```sh
k run -it --rm --image alpine server sh
k run -it --rm --image ubuntu server sh
k run --image hashicorp/terraform terraform --dry-run -oyaml | k neat > pods/terraform.yaml
k exec -it terraform -- sh
k get po -w 
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

