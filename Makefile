RUBY_CONTAINER_NAME=juicymo/drone-ruby
.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.PHONY: up
up:
	docker run --rm -it -v $(CURDIR):/blog -p 4000:4000 -w="/blog" $(RUBY_CONTAINER_NAME) bundle exec jekyll serve --host=0.0.0.0

.PHONY: build
build:
	jekyll serve

.PHONY: bundle-install
bundle-install:
	docker run --rm -it -v $(CURDIR):/blog -w="/blog" $(RUBY_CONTAINER_NAME) bundle install --path vendor

.PHONY: new-post
new-post:
	@read -p "Post file name: " newpostfilename; \
	touch ./_posts/`date +%Y-%m-%d`-$$newpostfilename.md

.PHONY: win-docker-up
win-docker-up:
	docker run --rm -it -v $(CURDIR):/blog -p 4000:4000 -w="/blog" $(RUBY_CONTAINER_NAME) bundle exec jekyll serve --host=0.0.0.0 --force-polling
