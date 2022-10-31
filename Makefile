#Defaults
include .env
export #exports the .env variables

IMAGE ?= tulibraries/noid-generator 
VERSION ?= $(DOCKER_IMAGE_VERSION)
HARBOR ?= harbor.k8s.temple.edu
CLEAR_CACHES=no
SECRET_KEY_BASE ?= $(SECRET_KEY_BASE)
RAILS_MASTER_KEY ?= $(NOIDS_MASTER_KEY)
NOIDS_DB_HOST ?= host.docker.internal
NOIDS_DB_NAME ?= noid-generators
NOIDS_DB_USER ?= noid

DEFAULT_RUN_ARGS ?= \
		-e "EXECJS_RUNTIME=Disabled" \
		-e "RAILS_ENV=production" \
		-e "RAILS_SERVE_STATIC_FILES=yes" \
		-e "NOIDS_DB_HOST=$(NOIDS_DB_HOST)" \
		-e "NOIDS_DB_NAME=$(NOIDS_DB_NAME)" \
		-e "NOIDS_DB_PASSWORD=$(NOIDS_DB_PASSWORD)" \
		-e "NOIDS_DB_USER=$(NOIDS_DB_USER)" \
		-e "SECRET_KEY_BASE=$(SECRET_KEY_BASE)" \
		-e "RAILS_LOG_TO_STDOUT=yes" \
		--rm -it \

run:
	@docker run --name=noid_generators -p 127.0.0.1:3001:3000/tcp \
		$(DEFAULT_RUN_ARGS) \
		$(HARBOR)/$(IMAGE):$(VERSION)

build:
	@docker build --build-arg SECRET_KEY_BASE=$(SECRET_KEY_BASE) --build-arg RAILS_MASTER_KEY \
		--tag $(HARBOR)/$(IMAGE):$(VERSION) \
		--tag $(HARBOR)/$(IMAGE):latest \
		--file .docker/app/Dockerfile \
		--progress plain \
		--no-cache .

lint:
	hadolint .docker/app/Dockerfile; \

scan:
	trivy image -c $(HARBOR)/$(IMAGE):$(VERSION); \

deploy: scan lint
	@docker push $(HARBOR)/$(IMAGE):$(VERSION) \
	# This "if" statement needs to be a one liner or it will fail.
	# Do not edit indentation
	@if [ $(VERSION) != latest ]; \
		then \
			docker push $(HARBOR)/$(IMAGE):latest; \
		fi