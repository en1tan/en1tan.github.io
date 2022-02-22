SHELL := /bin/bash
.POSIX:

DATEOF:=$(shell date +%FT%T)
HUGO_VERSION:=$(shell curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep 'tag_name' | cut -d '"' -f 4 | cut -c 2-)

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

entry: ## Launch $EDITOR with a new entry with TITLE=
	@if ! [ -d "./content/" ]; then mkdir content/; fi
	@if ! [ -d "./content/posts/" ]; then mkdir content/posts/; fi
	hugo new content/posts/$(shell printf "%q" "$(TITLE)").md

dev: ## Run the local development server
	hugo serve --enableGitInfo --disableFastRender --environment development
