#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda snakemake r-xfun r-bookdown=0.20 r-remotes r-tidyverse r-tufte r-cowplot;

source /opt/buildhome/.bashrc;
conda activate /opt/build/repo/yes;

 Rscript -e 'remotes::install_github("rstudio/blogdown@89e9efcf1b59cb85f6f1ad114f4f225b837a410f", upgrade="never")';


echo "Running snakemake"
snakemake -j 1;