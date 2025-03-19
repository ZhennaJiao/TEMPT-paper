#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 1


##Zhenna Jiao 
## 10 Dec 24 modified 

module load fastqc/0.12.1


## sample are reseq data 1x 

sample_list=("L02_L29-4")
data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241210/fastq_data


out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/01_fastqc

for i_sample in ${sample_list[@]}
do
    fastqc -o $out_dir \
            $data_proj/V350263750_${i_sample}_1.fq.gz\
            $data_proj/V350263750_${i_sample}_2.fq.gz
done