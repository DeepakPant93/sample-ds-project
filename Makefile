# Variables
IMAGE_NAME = deepak93p/sample-ds-project
TAG = latest
PLATFORMS = linux/amd64,linux/arm64

.PHONY: install
install: ## Install the poetry environment and install the pre-commit hooks
	@echo "🚀 Creating virtual environment using pyenv and poetry"
	@poetry install
	@ poetry run pre-commit install
	@poetry shell

.PHONY: check
check: ## Run code quality tools.
	@echo "🚀 Checking Poetry lock file consistency with 'pyproject.toml': Running poetry check --lock"
	@poetry check --lock
	@echo "🚀 Linting code: Running pre-commit"
	@poetry run pre-commit run -a
	@echo "🚀 Static type checking: Running mypy"
	# @poetry run mypy --show-error-codes --pretty --show-traceback -v
	@echo "🚀 Checking for obsolete dependencies: Running deptry"
	@poetry run deptry .

.PHONY: test
test: ## Test the code with pytest
	@echo "🚀 Testing code: Running pytest"
	@poetry run pytest --cov --cov-config=pyproject.toml --cov-report=xml

.PHONY: build
build: clean-build ## Build wheel file using poetry
	@echo "🚀 Creating wheel file"
	@poetry build -f wheel

.PHONY: clean-build
clean-build: ## clean build artifacts
	@rm -rf dist

.PHONY: update
update: ## Update project dependencies
	@echo "🚀 Updating project dependencies"
	@poetry update
	@poetry run pre-commit install --overwrite
	@echo "Dependencies updated successfully"

.PHONY: run
run: ## Run the project's main application
	@echo "🚀 Running the project"
	@poetry run python main.py

.PHONY: publish
publish: ## publish a release to pypi.
	@echo "🚀 Publishing: Dry run."
	@poetry config pypi-token.pypi $(PYPI_TOKEN)
	@poetry publish --dry-run
	@echo "🚀 Publishing."
	@poetry publish


.PHONY: build-and-publish
build-and-publish: build publish ## Build and publish.


.PHONY: docker-build
docker-build: # Build docker image
	docker build -t $(IMAGE_NAME):$(TAG) -f Dockerfile .

.PHONY: docker-push
docker-push: # Push docker image to the docker hub
	docker push $(IMAGE_NAME):$(TAG)

.PHONY: docker-build-and-push
docker-build-and-push: docker-build docker-push # Build and push docker image to the docker hub


.PHONY: git-init
git-init: ## Initialize git repository
	@echo "🚀 Initializing git repository"
	@git init
	@git add .
	@git commit -m "init commit"
	@git remote add origin git@github.com:DeepakPant93/sample-ds-project.git
	@git push -u origin main


.PHONY: docs-test
docs-test: ## Test if documentation can be built without warnings or errors
	@poetry run mkdocs build -s

.PHONY: docs
docs: ## Build and serve the documentation
	@poetry run mkdocs serve


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
