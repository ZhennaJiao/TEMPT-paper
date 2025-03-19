#!/bin/bash
#SBATCH --job-name=trim
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 1


## Zhenna Jiao
## 09 Dec 2024 modified 


module load trim_galore/0.6.10
module load fastqc/0.12.1   

# data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_30x_data_seq_202412/merged_data_new_20241220

# output=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/02_trimmed_data

# sample_list=("L29-7") 
# #"L121-1" "L121-7" "L29-1" "L29-4" "L29-7")"L30-2"


# for sample in ${sample_list[@]}
# do

# sbatch  --mem=75G --job-name=trim_${sample} /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/02_1_data_trim_main.sh $sample $data_proj $output
            
# done


### the lastest modified by Zhenna Jiao 20250102 analysis for add data 
sample_list=("L29-4_new" "L30-2_new")

data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_30x_data_seq_202412/merged_add_data_20250101

output=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/02_trimmed_data
shell_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/02_1_data_trim_main.sh

for sample in ${sample_list[@]}
do

sbatch  --mem=75G --job-name=trim_${sample} $shell_script  $sample $data_proj $output
            
done

