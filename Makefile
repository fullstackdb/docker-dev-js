build:
	$(eval tag := $(shell git rev-parse HEAD))
	@docker build -t nddev:${tag} .

run:
	$(eval tag := $(shell git rev-parse HEAD))
	docker run \
	${ARGS} \
	-it \
	--rm \
	--name node_develop \
	--mount type=bind,source=${PWD}/src,target=/usr/src/app/src \
	nddev:${tag}

run-shell:
		make ARGS=--entrypoint=/bin/sh run

deploy-all:
		$(eval tag ?= master)
		kubectl create -f k8s/cluster/namespace.yml
		@k8s/scripts/collect_deployments.sh --tag=${tag}
		@kubectl create -f k8s/apps/ingress.yml