#!/bin/bash
eval "$(conda shell.bash hook)"
conda activate $HOME/.conda/envs/meth


sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")

input_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/03_mapped_data_20241125
out_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/07_dedup_data_20241125

for sample in ${sample_list[@]}
do

deduplicate_bismark --paired --output_dir ${out_dir} \
                    ${input_dir}/${sample}_L2_1_val_1_bismark_bt2_pe.bam
done


conda deactivate
conda deactivate
