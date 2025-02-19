#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/index_hisat2_%j.out
#SBATCH -e ./log/index_hisat2_%j.err

date

cd ..

REF=data/reference/GRCh38.p14.genome.fa
index_path=data/index_hisat2

if [ ! -d $index_path ];then
    mkdir -p $index_path
    echo "make $index_path directory"
fi

hisat2-build $REF $index_path/hg38_genome


date