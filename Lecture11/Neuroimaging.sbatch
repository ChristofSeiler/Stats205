#!/bin/bash
#
#################
# set a job name
#SBATCH --job-name=Neuroimaging
#################
# time you think you need; default is one hour
#in minutes in this case
#SBATCH --time=08:00:00
#################
# queue
#SBATCH --qos=bigmem
#SBATCH --partition=bigmem
#################
# number of nodes you are requesting
#SBATCH --nodes=1
#################
# memory per node; default is 24GB per CPU for bigmem nodes
#SBATCH --mem=700000
#SBATCH --tasks-per-node=16
#################
# now run normal batch commands

module load R/3.2.0

echo '<!-- rmarkdown v1 -->' > NeuroimagingV1.Rmd
cat Neuroimaging.Rmd >> NeuroimagingV1.Rmd
Rscript -e "library(knitr); knit2html('NeuroimagingV1.Rmd')"
