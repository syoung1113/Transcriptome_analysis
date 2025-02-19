#!/usr/bin/bash
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 30-00:00
#SBATCH -p 36core
#SBATCH --mem=4G
#SBATCH -o ./log/stringtie_%j.out
#SBATCH -e ./log/stringtie_%j.err

date

cd ..

output_path=DEG/stringtie/read_count

gtf_files=($(find "$output_path" -type f -name "*.gtf"))


# sample_list 파일 생성
for gtf_file in "${gtf_files[@]}"; do
    base_name=$(basename "$gtf_file" .gtf)
    echo -e "$base_name\t$gtf_file" >> "$output_path/sample_list.txt"
done


# deseq2 prepare python 파일 돌리기
python DEG_5-2_stringtie_DESeq_prep.py \
 -i $output_path/sample_list.txt -v \
 -t $output_path/transcript_count_matrix.csv -g $output_path/gene_count_matrix.csv


date