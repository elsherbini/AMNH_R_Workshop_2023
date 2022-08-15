#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda snakemake r-xfun=0.19 r-remotes r-tidyverse r-tufte r-cowplot;

source /opt/buildhome/.bashrc;
conda activate /opt/build/repo/yes;

 Rscript -e 'remotes::install_github("rstudio/blogdown@2637c1cdfb997f0ff113cfa2225533a3d88f87c1", upgrade="never")';


echo "Running snakemake"
snakemake -j 1;