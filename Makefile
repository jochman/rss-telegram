.PHONY: build push

build:
	docker build -t jochman/rss-telegram:latest --platform linux/amd64,linux/arm64 .

push: build
	docker push jochman/rss-telegram:latest
