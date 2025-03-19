#!/bin/bash
#SBATCH --job-name=breath_cov
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 8


## source from (https://sarahpenir.github.io/bioinformatics/awk/calculating-mapping-stats-from-a-bam-file-using-samtools-and-awk/)

module load samtools/1.14

# Calculate the coverage of the breath


sample_list=("L02_L29-1" "L02_L29-4" "L02_L29-7" "L03_L121-1" "L03_L121-5" "L03_L121-7" "L03_L29-8" "L03_L30-2" "L03_L30-8")

## for these step we need sort the bam file first

input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/results/03_mapped_data
out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241210/results/06_breath_cov_data

# for sample in ${sample_list[@]}
# do
# samtools sort -@ 8  ${input_dir}/V350263750_${sample}_1_val_1_bismark_bt2_pe.bam > ${input_dir}/${sample}_1_val_1_bismark_bt2_pe_sorted.bam

# echo "sort done for ${sample}"

# done


## calculate breath coverage for each sample


for sample in ${sample_list[@]}
#gp02_14-24N
do

samtools depth -@ 8 -a ${input_dir}/${sample}_1_val_1_bismark_bt2_pe_sorted.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' \
                    > ${out_dir}/${sample}_breath_cov.txt 

echo "breath coverage done for ${sample}"
done  

