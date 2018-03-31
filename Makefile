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
		@./k8s/scripts/deploy.sh
 