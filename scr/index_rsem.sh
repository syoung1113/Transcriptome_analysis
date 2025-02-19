#!/usr/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=8G
#SBATCH -o ./log/index_rsem_%j.out
#SBATCH -e ./log/index_rsem_%j.err

date

cd ..

REF=data/reference/GRCh38.p14.genome.fa
gtf=data/reference/gencode.v47.basic.annotation.gtf
index_path=data/index_rsem

if [ ! -d $index_path ];then
    mkdir -p $index_path
    echo "make $index_path directory"
fi

rsem-prepare-reference \
 --gtf $gtf \
 -p 2 \
 $REF $index_path/index_rsem 

## If a STAR index file already exists, copy it to the RSEM index path
## If no STAR index file is available, you must use the --star option in rsem-prepare-reference

cp data/index_star/* $index_path


date