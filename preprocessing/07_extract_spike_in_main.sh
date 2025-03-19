#!/bin/bash
#SBATCH --job-name=sp 
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=4g
#SBATCH -n 24

module load samtools/1.18
sample=$1
spike_in_1=$2
spike_in_2=$3
input_dir=$4
sort_bam_dir=$5
output_dir=$6

samtools sort -@ 24  ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.bam -o ${sort_bam_dir}/${sample}_1_val_1_bismark_bt2_pe.sorted.bam
samtools index -@ 24 ${sort_bam_dir}/${sample}_1_val_1_bismark_bt2_pe.sorted.bam -o ${sort_bam_dir}/${sample}_1_val_1_bismark_bt2_pe.sorted.bam.bai
samtools view -@ 24 -bh ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.sorted.bam ${spike_in_1} ${spike_in_2} > ${output_dir}/${sample}_spike_in_sort.bam 