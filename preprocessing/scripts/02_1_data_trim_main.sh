#!/bin/bash
#SBATCH --job-name=trim
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=4g
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 16


## Zhenna Jiao
## 09 Dec 2024 modified 



module load trim_galore/0.6.10
module load fastqc/0.12.1   

data_proj=$2
output=$3
sample=$1

# data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241125/241121-A00151B

# output=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/02_trimred_data_20241125

# sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")

# for i_sample in ${sample_list[@]}
# do
trim_galore --length 35 --cores 8 --fastqc \
            --clip_R1 15 --clip_R2 10  --three_prime_clip_R1 10  --three_prime_clip_R2 10 -a2 "CTGTCTCTTATA" \
            -o ${output} \
            --paired  ${data_proj}/${sample}_1.fq.gz ${data_proj}/${sample}_2.fq.gz
            
# done


