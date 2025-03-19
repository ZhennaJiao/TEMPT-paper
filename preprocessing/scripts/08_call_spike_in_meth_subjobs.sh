#!/bin/bash
#SBATCH --job-name=meth
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH --nodes=1
#SBATCH -n 1
## 30 DEC 2024


#sample_list=("L30-2" "L121-1" "L121-7" "L29-1" "L29-4" "L29-7")

## modified by Zhenna Jiao on 20250104

sample_list=("L30-2_new" "L29-4_new")

data_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/05_spikein_QC/spike_in_bam
output=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/08_spikein_call_meth

bash_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/08_call_spike_in_meth_main.sh
for sample in ${sample_list[@]}
do

sbatch --mem=96G --job-name=${sample}_call_spikein_meth $bash_script $sample $data_dir $output

done

