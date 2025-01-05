IMAGE_NAME_MW=ghcr.io/chiefy/tdswiki:latest
IMAGE_NAME_NGINX=ghcr.io/chiefy/tdswiki-www:latest
IMAGE_NAME_S3SYNC=ghcr.io/chiefy/s3sync:latest

.PHONY: up
up:
	docker-compose up

.PHONY: build
build:
	docker-compose build

.PHONY: build-mediawiki
build-mediawiki:
	@cd mediawiki && docker build -t $(IMAGE_NAME_MW) .
	@docker push $(IMAGE_NAME_MW)
	@cd nginx && docker build -t $(IMAGE_NAME_NGINX) .
	@docker push $(IMAGE_NAME_NGINX)
	@cd s3sync && docker build -t $(IMAGE_NAME_S3SYNC) .
	@docker push $(IMAGE_NAME_S3SYNC)


.PHONY: login
login:
	@docker login --username chiefy --password $(GH_TOKEN) ghcr.io