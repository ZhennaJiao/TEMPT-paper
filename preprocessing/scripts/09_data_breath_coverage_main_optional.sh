#!/bin/bash
#SBATCH --job-name=breath_cov
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 16


## source from (https://sarahpenir.github.io/bioinformatics/awk/calculating-mapping-stats-from-a-bam-file-using-samtools-and-awk/)

module load samtools/1.14

# Calculate the coverage of the breath


sample=$1
input_dir=$2
out_dir=$3



samtools sort -@ 16  ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.deduplicated.bam \
              -o ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.deduplicated.sorted.bam

echo "sort done for ${sample}"


samtools depth -@ 16 -a ${input_dir}/${sample}_1_val_1_bismark_bt2_pe.deduplicated.sorted.bam | awk '{c++; if($3>0) total+=1}END{print (total/c)*100}' \
                    > ${out_dir}/${sample}_breath_cov.txt 

echo "breath coverage done for ${sample}"
 

