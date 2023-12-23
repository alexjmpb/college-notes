start_project:
	mkdir -p $(category)/$(period)/$(course)
	cd $(category)/$(period)/$(course)
	cookieninja -f https://github.com/alexjmpb/cookiecutter-latex

sync_all:
	bash ./sync_util/sync_all.sh $(shell pwd)