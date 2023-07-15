SHELL := /bin/bash


all: init format lint

check: format lint

init:
	conda env create -f environment.yaml --force
	${CONDA_ENV_PATH}/bin/python -m pre_commit install -f

format:
	poetry run black .
	poetry run isort . --skip-gitignore --profile black

pre-commit:
	${CONDA_ENV_PATH}/bin/python -m pre_commit run