#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda snakemake r-blogdown=0.21 r-knitr=1.30 r-xfun r-bookdown=0.17 r-tidyverse r-cowplot r-remotes r-tufte=0.8;

echo "activating conda"
source /opt/buildhome/.bashrc;
conda activate /opt/build/repo/yes;
echo $PATH

Rscript -e 'remotes::install_github("yihui/knitr@54577dd5cac5cee9887aa44235cb37611be92411", upgrade="never", force=TRUE)';

Rscript -e 'remotes::install_github("rstudio/blogdown@0e2e33f71adadf3d85aac4fa0fb23584721d4b75", upgrade="never", force=TRUE)';


echo "Running snakemake"
snakemake -j 1;