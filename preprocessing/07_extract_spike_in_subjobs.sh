#!/bin/bash
## modified by Zhenna Jiao 20250104
# module load samtools/1.18
spike_in_1="lambda"
spike_in_2="2kb_3|Unmodified"
input_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data
sort_bam_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data
output_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/05_spikein_QC/spike_in_bam
shell_scripts=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/06_extract_spike_in_main.sh
sample_list=("L30-2_new" "L29-4_new")

for sample in ${sample_list[@]}
do
sbatch   --job-name=spike_${sample}  $shell_scripts $sample $spike_in_1 $spike_in_2 $input_dir $sort_bam_dir $output_dir
done
