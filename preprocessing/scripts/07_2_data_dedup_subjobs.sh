#!/bin/bash
#SBATCH --job-name=de_dup
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 1


# eval "$(conda shell.bash hook)"
# conda activate /home/jiaozhenna/.conda/envs/meth


#sample_list=("L30-2" "L121-1" "L121-7" "L29-1" "L29-4" "L29-7")

## sample list modified 2025 01 04 by Zhenna Jiao
sample_list=("L30-2_new" "L29-4_new")



input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data
out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/07_dedup_data

for sample in ${sample_list[@]}
do

sbatch --mem=96G --job-name=${sample}_dedup /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/07_1_data_dedup_main.sh $sample $input_dir $out_dir
done


# conda deactivate
# conda deactivate