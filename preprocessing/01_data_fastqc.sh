#!/bin/bash
##Zhenna Jiao 
## 10 Dec 24 modified 

module load fastqc/0.12.1
sample_list=("L02_L29-4")
data_proj=$HOME/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241210/fastq_data
out_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/01_fastqc

for i_sample in ${sample_list[@]}
do
    fastqc -o $out_dir \
            $data_proj/V350263750_${i_sample}_1.fq.gz\
            $data_proj/V350263750_${i_sample}_2.fq.gz
done
