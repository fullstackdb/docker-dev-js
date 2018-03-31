build:
	@docker build -t develop:node .

run:
	@docker run  -v /home/vdzundza/go/src/github.com/docker-dev-js:/var/www -it develop:node