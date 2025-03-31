#!/bin/bash
## modified by Zhenna Jiao on 20250104

sample_list=("L30-2_new" "L29-4_new")

data_dir=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/05_spikein_QC/spike_in_bam
output=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/08_spikein_call_meth

bash_script=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/08_call_spike_in_meth_main.sh
for sample in ${sample_list[@]}
do

sbatch --mem=96G --job-name=${sample}_call_spikein_meth $bash_script $sample $data_dir $output

done

