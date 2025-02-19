#!/usr/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=8G
#SBATCH -o ./log/index_star_%j.out
#SBATCH -e ./log/index_star_%j.err

date

cd ..

REF=data/reference/GRCh38.p14.genome.fa
gtf=data/reference/gencode.v47.basic.annotation.gtf
index_path=data/index_star

if [ ! -d $index_path ];then
    mkdir -p $index_path
    echo "make $index_path directory"
fi

STAR \
 --runMode genomeGenerate \
 --sjdbGTFfile $gtf \
 --genomeFastaFiles $REF \
 --genomeDir $index_path \
 --outFileNamePrefix index \
 --runThreadN 2


date