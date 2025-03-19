#!/bin/bash
#SBATCH --job-name=de_dup
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 24


eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth

sample=$1
input_dir=$2
out_dir=$3


# sample_list=("L121-1" "L121-2" "L121-3" "L121-4" "L121-6" "L121-8" "L30-1" "L30-2" "L30-3" "L30-4" "L30-5" "L30-6" "L30-7")

# input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241209/results/03_mapped_data
# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241209/results/07_dedup_data

# for sample in ${sample_list[@]}
# do

deduplicate_bismark --paired --output_dir ${out_dir} \
                    ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.bam
# done


conda deactivate
conda deactivate