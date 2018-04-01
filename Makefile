build:
	$(eval tag ?= master)
	@docker build -t app:${tag} .

run:
	$(eval tag ?= master)
	docker run \
	${ARGS} \
	-it \
	--rm \
	--name node_develop \
	--mount type=bind,source=${PWD}/src/,target=/usr/src/app/src/ \
	app:${tag}

run-shell:
		make ARGS=--entrypoint=/bin/sh run

infra:
		kubectl apply --force -f  k8s/cluster/namespace.yml

deploy-all:
		$(eval tag ?= master)
		@k8s/scripts/collect_deployments.sh --tag=${tag} --component=app-one
		@kubectl apply --force -f k8s/apps/ingress.yml

loadbalancer-info:
		@kubectl describe ing -n my-ns