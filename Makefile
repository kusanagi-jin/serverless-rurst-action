
VERSION ?= 0.2.5
RUST_VERSION ?= 1.38.0
REPO ?= jaigouk/serverless-rust-action
TAG ?= "$(REPO):$(VERSION)-rust-$(RUST_VERSION)"

publish: build
	@docker push $(TAG)
	@docker push $(REPO):latest

build:
	@docker build --build-arg RUST_VERSION=$(RUST_VERSION) -t $(TAG) .
	@docker tag $(TAG) $(REPO):latest

