#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/salmon_quant_%j.out
#SBATCH -e ./log/salmon_quant_%j.err

date

cd ..

index=data/index_salmon
fastq_path=data/raw_fastq
output_path=DEG/salmon/read_count
sample=$1

libtype=A
# S: stranded / A: auto

echo $sample

# you need fastq file

if [ ! -d $output_path ];then
    mkdir -p $output_path
    echo "make $output_path directory"
fi

salmon quant \
 -i $index \
 -l $libtype \
 -1 $fastq_path/$sample\_1.fastq.gz -2 $fastq_path/$sample\_2.fastq.gz \
 --validateMappings \
 -o $output_path/$sample

date

