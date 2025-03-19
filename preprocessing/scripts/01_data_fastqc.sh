#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --partition fat
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 1


##Zhenna Jiao 
## 25 NOV 24 modified 

module load fastqc/0.12.1


## sample are reseq data 1x 

sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")

data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241125/241121-A00151B


out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/fastqc_20241125

for i_sample in ${sample_list[@]}
do
    fastqc -o $out_dir \
            $data_proj/${i_sample}_L2_1.fq.gz\
            $data_proj/${i_sample}_L2_2.fq.gz
done