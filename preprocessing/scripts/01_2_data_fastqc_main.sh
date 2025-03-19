#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --partition fat
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=25g
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 2


##Zhenna Jiao 
## 17 Dec 24 modified 

module load fastqc/0.12.1


## sample are reseq data 1x 

# sample_list=("L02_L29-1" "L02_L29-4" "L02_L29-7" "L03_L121-1" "L03_L121-5" "L03_L121-7" "L03_L29-8" "L03_L30-2" "L03_L30-8")

# data_proj=/home/jiaozhenna/methylation/project/EM_seq/data/20241125_TEMPT_RESEQ_DATA/sample_1x_data_20241210/fastq_data


# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/results/01_fsatqc

i_sample=$1
data_proj=$2
out_dir=$3

# for i_sample in ${sample_list[@]}
# do
    fastqc -o $out_dir \
            $data_proj/${i_sample}_1.fq.gz\
            $data_proj/${i_sample}_2.fq.gz
# done