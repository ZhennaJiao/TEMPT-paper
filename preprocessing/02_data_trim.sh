#!/bin/bash
## Zhenna Jiao
## 25 NOV 2024 modified 

module load trim_galore/0.6.10
module load fastqc/0.12.1   

data_proj=$HOME/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241125/241121-A00151B

output=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/02_trimred_data_20241125

sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")

for i_sample in ${sample_list[@]}
do
trim_galore --length 35 --cores 4 --fastqc \
            --clip_R1 15 --clip_R2 10  --three_prime_clip_R1 10  --three_prime_clip_R2 10 -a2 "CTGTCTCTTATA" \
            -o ${output} \
            --paired  $data_proj/${i_sample}_L2_1.fq.gz $data_proj/${i_sample}_L2_2.fq.gz
            
done

