#!/bin/bash
#SBATCH --job-name=map
#SBATCH --partition fat
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=25G
#SBATCH -n 4


##Zhenna Jiao
## 30 April 24 modified

eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth

sample_list=("L15-1" "L15-2" "L15-3" "L15-4" "L15-5" "L15-6" "L15-7" "L15-8")


ref=/home/jiaozhenna/methylation/ref/bis_ref/

out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/03_mapped_data_20241125/

ptemp_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/tmp

input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/results/02_trimred_data_20241125

for smaple in ${sample_list[@]}
do
    fq1=${input_dir}/${smaple}_L2_1_val_1.fq.gz
    fq2=${input_dir}/${smaple}_L2_2_val_2.fq.gz
    

        bismark --parallel 4  --genome_folder ${ref} \
                --local  -1 ${fq1} -2 ${fq2} \
                --temp_dir ${ptemp_dir} \
                -o  ${out_dir} 
done

conda deactivate 
conda deactivate


