#!/bin/bash
##Zhenna Jiao
## 26 Nov 24 modified

eval "$(conda shell.bash hook)"
conda activate $HOME/.conda/envs/meth

sample=$1
input_dir=$2
out_dir=$3

echo$sample

bismark_methylation_extractor --bedGraph --no_header --comprehensive --merge_non_CpG --multicore 4 \
                               ${input_dir}/${sample}_L2_1_val_1_bismark_bt2_pe.deduplicated.bam \
                                -o ${out_dir}


conda deactivate 
