#!/bin/bash
#SBATCH --job-name=meth
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH --nodes=1
#SBATCH -n 16

##22 March 24
module load samtools/1.18

eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth

sample=$1
data_dir=$2
output=$3
samtools sort -n ${data_dir}/${sample}_spike_in_sort.bam \
              -o ${data_dir}/${sample}_spike_in_unsort.bam 



bismark_methylation_extractor --bedGraph --no_header --comprehensive \
                              --merge_non_CpG --multicore 4 \
                              ${data_dir}/${sample}_spike_in_unsort.bam \
                                -o ${output}

conda deactivate
conda deactivate
