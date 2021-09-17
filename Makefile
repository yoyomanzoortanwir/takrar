# https://medium.com/@dhavalmetrani/makefiles-and-docker-versioning-8c15ccc76994
# VERSION=$(shell head -n 1 VERSION)
REPO_NAME="takrar"
REPO_URL="https://github.com/Yoyomanzoor/takrar"
VERSION_FILE=VERSION

.PHONY: git-push

help :                     ## Show this help.
	@grep -h "##" $(MAKEFILE_LIST) | grep -v grep | tr -d '##' | tr -d '$$'


.PHONY: all
all : clean pdf gitbook epub move      ## Render gitbook and PDF

.PHONY: set
set :
	set -ev

.PHONY: pdf
pdf : clean                     ## Render PDF
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

.PHONY: gitbook
gitbook : clean                 ## Render gitbook
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

.PHONY: epub
epub : clean
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

.PHONY: move
move :
	cp -r _book/* docs/

.PHONY: clean
clean :                    ## Clean gitbook output (docs folder)
	rm -rf docs/
	rm -rf _book/
	rm -rf _bookdown_files/

.PHONY: git-status
git-status :               ## Show everything but website file changes
	@git status | grep -v docs | grep -v _bookdown_files

