#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda r-remotes snakemake r-tidyverse r-knitr=1.30 r-blogdown=0.21 r-xfun=0.19 r-tufte r-cowplot;
 Rscript -e 'remotes::install_github("rstudio/blogdown@2637c1cdfb997f0ff113cfa2225533a3d88f87c1", upgrade="never")';

source /opt/buildhome/.bashrc;
conda activate base;

echo "Running snakemake"
snakemake -j 1;