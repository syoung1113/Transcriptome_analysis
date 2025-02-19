#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/rsem_%j.out
#SBATCH -e ./log/rsem_%j.err

date

cd ..

index=data/index_rsem
fastq_path=data/raw_fastq
output_path=DEG/rsem/read_count
sample=$1

echo $sample

if [ ! -d $output_path ];then
    mkdir -p $output_path
    echo "make $output_path directory"
fi

rsem-calculate-expression \
 --star -p 4 --keep-intermediate-files --star-gzipped-read-file \
 --paired-end $fastq_path/$sample/$sample\_R1.fastq.gz $fastq_path/$sample/$sample\_R2.fastq.gz \
 $index/index_rsem $output_path/$sample



date

