#!/bin/bash
#SBATCH --job-name=fastqc_new 
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 1


##Zhenna Jiao 
## 17 Dec 24 modified 

# module load fastqc/0.12.1


## sample are reseq data 1x 

#sample_list=("L29-1" "L29-4" "L29-7")
#the second batch of reseq data 1x

#sample_list=("L30-2" "L121-1" "L121-7" "L29-1" "L29-4" "L29-7")
# sample_list=("L29-4")

# data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_30x_data_seq_202412/merged_data_new_20241220
# shell_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/01_2_data_fastqc_main.sh

# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/01_fastqc
# for i_sample in ${sample_list[@]}
# do
# sbatch  --mem=50G --job-name=${i_sample} $shell_script $i_sample $data_proj $out_dir 
# done


# the lastest modified by Zhenna Jiao 20250102 analysis for add data 
sample_list=("L29-4_new" "L30-2_new")

data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_30x_data_seq_202412/merged_add_data_20250101
shell_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/01_2_data_fastqc_main.sh

out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/01_fastqc
for i_sample in ${sample_list[@]}
do
sbatch  --mem=50G --job-name=${i_sample} $shell_script $i_sample $data_proj $out_dir 
done