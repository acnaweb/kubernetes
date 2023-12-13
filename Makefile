deploy:
	kubectl apply -f src/mongodb.pod.yaml; \
	kubectl apply -f src/simple-node-api.pod.yaml; \
	kubectl apply -f src/simple-node-api.service.yaml; \