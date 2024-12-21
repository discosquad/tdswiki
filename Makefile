IMAGE_NAME=ghcr.io/chiefy/tdswiki:latest

.PHONY: up
up:
	docker-compose up

.PHONY: build
build:
	docker-compose build

.PHONY: build-mediawiki
build-mediawiki:
	@cd mediawiki && docker build -t $(IMAGE_NAME) .
	@docker push $(IMAGE_NAME)

.PHONY: login
login:
	@docker login --username chiefy --password $(GH_TOKEN) ghcr.io