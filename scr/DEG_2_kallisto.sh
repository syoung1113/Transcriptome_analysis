#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/kallisto_quant_%j.out
#SBATCH -e ./log/kallisto_quant_%j.err

date

cd ..

index=data/index_kallisto/kallisto_index.idx
fastq_path=data/raw_fastq
output_path=DEG/kallisto/read_count
sample=$1

echo $sample


# you need fastq file

if [ ! -d $output_path/$sample ];then
    mkdir -p $output_path/$sample
    echo "make $output_path/$sample directory"
fi

kallisto quant \
 -i $index \
 -o $output_path/$sample \
 -b 100 \
 $fastq_path/$sample\_1.fastq.gz $fastq_path/$sample\_2.fastq.gz


date

