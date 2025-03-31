#!/bin/bash
##22 March 24
module load samtools/1.18

eval "$(conda shell.bash hook)"
conda activate $HOME/.conda/envs/meth

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
