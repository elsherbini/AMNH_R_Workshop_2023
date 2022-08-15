#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda snakemake r-blogdown=0.21 r-xfun r-bookdown r-remotes r-tidyverse r-tufte=0.9 r-cowplot;

echo "activating conda"
source /opt/buildhome/.bashrc;
conda activate /opt/build/repo/yes;
echo $PATH

 Rscript -e 'remotes::install_github("rstudio/blogdown@0e2e33f71adadf3d85aac4fa0fb23584721d4b75", upgrade="never", force=TRUE)';


echo "Running snakemake"
snakemake -j 1;