#!/bin/bash
#SBATCH --job-name=sp 
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=4g
#SBATCH -n 1

# module load samtools/1.18
spike_in_1="lambda"
spike_in_2="2kb_3|Unmodified"
input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data
sort_bam_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data
output_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/05_spikein_QC/spike_in_bam

# sample_list=("L30-2" "L121-1" "L121-7" "L29-1" "L29-4" "L29-7")

## modified by Zhenna Jiao 20250104 
sample_list=("L30-2_new" "L29-4_new")

for sample in ${sample_list[@]}
do
sbatch   --job-name=spike_${sample}  /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/06_extract_spike_in_main.sh $sample $spike_in_1 $spike_in_2 $input_dir $sort_bam_dir $output_dir
done