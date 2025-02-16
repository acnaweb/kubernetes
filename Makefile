kind_create_cluster:
	cd cluster-kind && \
	kind create cluster --config config.yaml --name devops --kubeconfig config

start_minikube:
	minikube start

deploy:
	kubectl apply -f src/mongodb.pod.yaml; \
	kubectl apply -f src/simple-node-api.pod.yaml; \
	kubectl apply -f src/simple-node-api.service.yaml; \

