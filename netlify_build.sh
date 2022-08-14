#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda r-remotes snakemake r-tidyverse r-blogdown=0.21 r-xfun r-tufte r-cowplot;
 Rscript -e 'remotes::install_github("rstudio/blogdown@f9067888face374fda78d221aec595f875155edc")';

source /opt/buildhome/.bashrc;
conda activate base;

echo "Running snakemake"
snakemake -j 1;