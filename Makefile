RUBY_CONTAINER_NAME=juicymo/drone-ruby
.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: up
up:
	JEKYLL_ENV=local jekyll serve

.PHONY: build
build:
	jekyll serve

.PHONY: win-docker-up
win-docker-up:
	docker run --rm -it -v $$(pwd):/blog -p 4000:4000 -w="/blog" $(RUBY_CONTAINER_NAME) bundle exec jekyll serve --host=0.0.0.0 --force-polling
