#!/bin/bash

systemctl;

# install mamba-forge

echo "Installing mamba-forge"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
yes yes| bash Mambaforge-$(uname)-$(uname -m).sh

source /opt/buildhome/.bashrc;

echo "Installing snakemake"
mamba install -c conda-forge -c bioconda snakemake r-tidyverse r-blogdown=0.21 r-xfun r-tufte r-cowplot;

source /opt/buildhome/.bashrc;
conda activate base;

echo "Running snakemake"
snakemake -j 1;