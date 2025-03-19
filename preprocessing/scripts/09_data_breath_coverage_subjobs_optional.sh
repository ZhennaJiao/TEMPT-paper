#!/bin/bash
#SBATCH --job-name=breath_cov
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 1


## source from (https://sarahpenir.github.io/bioinformatics/awk/calculating-mapping-stats-from-a-bam-file-using-samtools-and-awk/)

module load samtools/1.14

# Calculate the coverage of the breath


##sample_list=("L30-2" "L121-1" "L121-7" "L29-1" "L29-4" "L29-7")

## modified by Zhenna Jiao on 20250104
sample_list=("L30-2_new" "L29-4_new")

input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/07_dedup_data
out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/06_breath_cov_data
shell_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/09_data_breath_coverage_main_optional.sh
for sample in ${sample_list[@]}
do

sbatch --job-name=${sample}_breath_cov $shell_script $sample $input_dir $out_dir

done
 

