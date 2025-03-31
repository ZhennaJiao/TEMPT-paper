#!/bin/bash

## 08 July 24 last modified 
## because some region are in genome's blacklist, this may take some noise in our downstrem analysis on dmr 
## so it is necessary to remove them 
## The code refers to  https://www.biostars.org/p/184537/
## the hg38 genome blacklist download from  https://github.com/Boyle-Lab/Blacklist

module load bedtools/2.31.0 

dmr_file_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/results/

## Firstly, sort the bed file
bedtools sort -i ${dmr_file_dir}/DMR_delta_015_filtered_sample_20250213.txt > ${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed


## remove the blacklist region
bed_a=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed
blacklist=$HOME/methylation/project/EM_seq/ref/hg38-blacklist.v2.sorted.bed
out_dir=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted_remove_blacklist.bed

 
bedtools intersect -v -a ${bed_a}\
                        -b ${blacklist} \
                        > ${out_dir}



