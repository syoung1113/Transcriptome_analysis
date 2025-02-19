#!/usr/bin/bash
#SBATCH -n 2
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=8G
#SBATCH -o ./log/index_salmon_%j.out
#SBATCH -e ./log/index_salmon_%j.err

date

cd ..

genome_REF=data/reference/GRCh38.p14.genome.fa.gz
transcript_REF=data/reference/gencode.v47.transcripts.fa.gz
REF=data/reference/gencode.v47.gentrome.fa.gz
index_path=data/index_salmon

if [ ! -d $index_path ];then
    mkdir -p $index_path
    echo "make $index_path directory"
fi

grep "^>" <(gunzip -c $genome_REF) | cut -d " " -f 1 > $index_path/decoys.txt
sed -i.bak -e 's/>//g' $index_path/decoys.txt

cat $transcript_REF $genome_REF > $REF

salmon index -t $REF -i $index_path --decoys $index_path/decoys.txt -k 31 --gencode


date