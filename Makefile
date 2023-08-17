.DEFAULT_GOAL := serve
SHELL:=/bin/bash
serve:
	. .venv/bin/activate
	mkdocs serve

install:
	source .venv/bin/activate
	pip install -r requirements.txt
	pre-commit install

format:
	. .venv/bin/activate
	pre-commit run --all-files

deploy-gh-pages:
	. .venv/bin/activate
	mkdocs gh-deploy
