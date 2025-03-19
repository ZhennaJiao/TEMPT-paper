#!/bin/bash
#SBATCH --job-name=call_meth
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 12



##Zhenna Jiao
## 26 NOv 24 modified

eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth

sample=$1
input_dir=$2
out_dir=$3

echo$sample

bismark_methylation_extractor --bedGraph --no_header --comprehensive --merge_non_CpG --multicore 4 \
                               ${input_dir}/${sample}_L2_1_val_1_bismark_bt2_pe.deduplicated.bam \
                                -o ${out_dir}


