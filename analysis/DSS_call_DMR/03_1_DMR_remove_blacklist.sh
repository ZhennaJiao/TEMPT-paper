#!/bin/bash

## 08 July 24 last modified 
##  It is necessary to remove the blacklist regions because they are in genome's blacklist, which may take some noise into our downstream analysis on DMRs 
## The code refers to  https://www.biostars.org/p/184537/
## The hg38 genome blacklist was downloaded from  https://github.com/Boyle-Lab/Blacklist

module load bedtools/2.31.0 

dmr_file_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/results/

## Firstly, sort the bed file
bedtools sort -i ${dmr_file_dir}/DMR_delta_015_filtered_sample_20250213.txt > ${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed


## remove the blacklist regions
bed_a=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted.bed
blacklist=$HOME/methylation/project/EM_seq/ref/hg38-blacklist.v2.sorted.bed
out_dir=${dmr_file_dir}/DMR_delta_015_filtered_smaple_20250213_sorted_remove_blacklist.bed

 
bedtools intersect -v -a ${bed_a}\
                        -b ${blacklist} \
                        > ${out_dir}



