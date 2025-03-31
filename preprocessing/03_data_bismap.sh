#!/bin/bash
##Zhenna Jiao
## 30 April 24 modified

eval "$(conda shell.bash hook)"
conda activate $HOME/.conda/envs/meth

sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")


ref=$HOME/methylation/ref/bis_ref/

out_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/03_mapped_data_20241125/

ptemp_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/tmp

input_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/02_trimred_data_20241125

for sample in ${sample_list[@]}
do
    fq1=${input_dir}/${sample}_L2_1_val_1.fq.gz
    fq2=${input_dir}/${sample}_L2_2_val_2.fq.gz
    

        bismark --parallel 4  --genome_folder ${ref} \
                --local  -1 ${fq1} -2 ${fq2} \
                --temp_dir ${ptemp_dir} \
                -o  ${out_dir} 
done

conda deactivate 
conda deactivate


