.PHONY: up
up:
	hugo serve

.PHONY: new-post
new-post:
	@if [ -z "$(name)" ]; then \
		echo "Usage: make new-post name=filename"; \
		exit 1; \
	fi
	hugo new content "content/post/$(name).md"
