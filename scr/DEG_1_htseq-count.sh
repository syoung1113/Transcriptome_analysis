#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/htseq_count_%j.out
#SBATCH -e ./log/htseq_count_%j.err

date

cd ..

gtf=data/reference/gencode.v47.basic.annotation.gtf
hisat_bam_path=DEG/hisat2_mapping
output_path=DEG/htseq-count/read_count
sample=$1

echo $sample

# you need bam file

if [ ! -d $output_path ];then
    mkdir -p $output_path
    echo "make $output_path directory"
fi

htseq-count \
 -f bam -t gene -s no -i gene_name \
 $hisat_bam_path/$sample.sorted.bam \
 $gtf \
 > $output_path/$sample.count


date

