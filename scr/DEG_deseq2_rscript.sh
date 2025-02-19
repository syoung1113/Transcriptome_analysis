#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/rscript_%j.out
#SBATCH -e ./log/rscript_%j.err
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=syoung1113@g.skku.edu

date

cd ..

datainfopath='data/datainfo'
deg_type="_for_deg1"
tool="star"
plotpath='DEG'
datapath='readcount'

Rscript DEG_R_deseq2.R $deg_type $tool $plotpath/$tool $datapath/$tool $datainfopath/datainfo$deg_type.txt $filter
date
