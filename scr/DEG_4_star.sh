#!/usr/bin/bash
#SBATCH -n 4
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=16G
#SBATCH -o ./log/star_genecount_%j.out
#SBATCH -e ./log/star_genecount_%j.err

date

cd ..

gtf=data/reference/gencode.v47.basic.annotation.gtf
index=data/index_star
fastq_path=data/raw_fastq
output_path=DEG/star/read_count
sample=$1

echo $sample

# you need fastq file

if [ ! -d $output_path ];then
    mkdir -p $output_path
    echo "make $output_path directory"
fi

STAR \
 --genomeDir $index \
 --readFilesIn $fastq_path/$sample\_1.fastq.gz $fastq_path/$sample\_2.fastq.gz \
 --sjdbGTFfile $gtf \
 --quantMode GeneCounts\
 --outFileNamePrefix $output_path/$sample \
 --runThreadN 4


date

