#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/index_kallisto_%j.out
#SBATCH -e ./log/index_kallisto_%j.err

date

cd ..

REF=data/reference/gencode.v47.transcripts.fa.gz
index_path=data/index_kallisto

if [ ! -d $index_path ];then
    mkdir -p $index_path
    echo "make $index_path directory"
fi

kallisto index -i $index_path/kallisto_index.idx $REF


date