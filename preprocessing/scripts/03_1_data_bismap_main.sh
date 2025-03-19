#!/bin/bash
#SBATCH --job-name=map
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 60


##Zhenna Jiao
## 07 Dec 24 modified

eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth


ref=$4
out_dir=$3
ptemp_dir=$5
input_dir=$2
sample=$1

# sample_list=("L29-2" "L29-3" "L29-5" "L29-6" "s3-1" "s3-2" "s3-3" "TE-2" "TE-3" "TE-4" "Undetermined-1" "Undetermined-3")


# ref=/home/jiaozhenna/methylation/ref/bis_ref/

# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241206/results/03_mapped_data/

# ptemp_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/temp

# input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241206/results/02_trimmed_data

# for smaple in ${sample_list[@]}
# do
    fq1=${input_dir}/${sample}_1_val_1.fq.gz
    fq2=${input_dir}/${sample}_2_val_2.fq.gz


    bismark --parallel 4  --genome_folder ${ref} \
            --local  -1 ${fq1} -2 ${fq2} \
            --temp_dir ${ptemp_dir} \
            -o  ${out_dir} 
# done

# conda deactivate 
# conda deactivate


