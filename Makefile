
default: serve
NAME:=knowledge-base
CONTAINER:=mkdocs

.PHONY: container
container:
	docker build -t $(CONTAINER) ./ --build-arg GITHUB_TOKEN=$(GITHUB_TOKEN)

.PHONY: serve
serve: container
	docker run --rm -it -p 8000:8000 -v $(PWD):/ -w / $(CONTAINER)

.PHONY: build
build:
	which mkdocs || pip3 install mkdocs
	pip3 install -r requirements.txt
	cd src && mkdocs build -d ../dist

.PHONY: deploy
deploy: build
	npm ci
	npm run deploy