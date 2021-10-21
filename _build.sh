#!/bin/sh

set -ev

R -e 'install.packages(c("ggplot2", "ggpubr", "magrittr", "dplyr", "MASS", "kableExtra"))'
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"

