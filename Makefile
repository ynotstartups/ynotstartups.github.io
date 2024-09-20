# note that `make` uses bash instead of fish shell
deploy-gh-pages:
	docker run --rm -it \
		-v ~/.ssh:/root/.ssh \
		-v ${PWD}:/docs squidfunk/mkdocs-material \
		gh-deploy --strict --verbose

serve:
	docker run --rm -it -p 8001:8000 \
		-v ${PWD}:/docs squidfunk/mkdocs-material
