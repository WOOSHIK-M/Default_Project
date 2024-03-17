SHELL := /bin/bash


all: init format lint

check: format lint

init:
	pip install -U pip
	pip install pdm
	pdm init

init-dev:
	pdm install
	pre-commit install
	python3 -m pre_commit run

format:
	pdm run black .
	pdm run isort . --skip-gitignore --profile black

format-check:
	pdm run black . --check
	pdm run isort . --skip-gitignore --profile black --check

pre-commit:
	python3 -m pre_commit run

pre-commit-all:
	python3 -m pre_commit run --all-files

tree:
	tree

help:
	@echo "Usage: make [target]"
	@echo
	@echo "Available targets:"
	@echo "  init:"
	@echo "    Initialize poetry project"
	@echo "  format:"
	@echo "    Format the code"
	@echo "  tree:"
	@echo "    Show the directory tree"
	@echo
	@echo "  help:"
	@echo "    Show this help message"
