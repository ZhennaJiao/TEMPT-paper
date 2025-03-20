#!/bin/bash
#SBATCH --job-name=rm_blacklist_for_dmrs
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --nodes=1
#SBATCH -n 1


## 08 July 24 last modified 
## because some region are in genome's blacklist ,this may take some noise in our downstrem analysis on dmr 
## so it is necessary to remove them 
## the code refer to  https://www.biostars.org/p/184537/
## the hg38 genome blacklist download from  https://github.com/Boyle-Lab/Blacklist

module load bedtools/2.31.0 

dmr_file_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/results/

## firstly sort the bed file
bedtools sort -i ${dmr_file_dir}/DMR_delta_015_filtered_sample_20250213.txt > ${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed


## remove the blacklist region
bed_a=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed
blacklist=/home/jiaozhenna/methylation/project/EM_seq/ref/hg38-blacklist.v2.sorted.bed
out_dir=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted_remove_blacklist.bed

 
bedtools intersect -v -a ${bed_a}\
                        -b ${blacklist} \
                        > ${out_dir}



