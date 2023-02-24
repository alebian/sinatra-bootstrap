# https://news.ycombinator.com/item?id=11939200
.PHONY: help
help:	### this screen. Keep it first target to be default
ifeq ($(UNAME), Linux)
	@grep -P '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
else
	@# this is not tested, but prepared in advance for you, Mac drivers
	@awk -F ':.*###' '$$0 ~ FS {printf "%15s%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk' | sort
endif

clean:
	rm .make.*

bundle: .make.bundle

.make.bundle: Gemfile
	bundle install
	touch .make.bundle

serve: bundle
	@bundle exec puma -C ./config/puma.rb

workers: bundle
	@bundle exec sidekiq -r ./lib/boot.rb -C ./config/sidekiq.yml

.PHONY: test
test: bundle
	bundle exec rspec

.PHONY: lint
lint: bundle
	bundle exec rubocop --parallel Gemfile bin lib spec web config

.PHONY: audit
audit: bundle
	@bundle exec bundle audit check --update

.PHONY: static
static: lint audit

.PHONY: pre-push
pre-push: lint audit test
