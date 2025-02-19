#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/hisat2_mapping_%j.out
#SBATCH -e ./log/hisat2_mapping_%j.err

date

cd ..

fastq_path=data/raw_fastq
output_path=DEG/hisat2_mapping
sample=$1

echo $sample

# you need fastq file

if [ ! -d $output_path ];then
    mkdir -p $output_path
    echo "make $output_path directory"
fi


hisat2 -x data/reference/index_hisat2/hg38_genome \
 -1 $fastq_path/$sample\_1.fastq.gz -2 $fastq_path/$sample\_2.fastq.gz \
 -S $output_path/$sample.sam

samtools view -b $output_path/$sample.sam > $output_path/$sample.bam
rm $output_path/$sample.sam

samtools sort -O bam -o $output_path/$sample.sorted.bam  $output_path/$sample.bam

samtools index $output_path/$sample.sorted.bam


date

