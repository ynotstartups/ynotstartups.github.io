.DEFAULT_GOAL := serve
SHELL:=/opt/homebrew/bin/fish
serve:
	source .venv/bin/activate.fish; mkdocs serve

install:
	source .venv/bin/activate.fish; pip install -r requirements.txt; pre-commit install

format:
	source .venv/bin/activate.fish; pre-commit run --all-files

deploy-gh-pages:
	# strict to abort building gh pages when there are warnings such as
	# incorrect link after renamed markdowns
	source .venv/bin/activate.fish; mkdocs gh-deploy --strict
	# source .venv/bin/activate.fish; mkdocs gh-deploy
