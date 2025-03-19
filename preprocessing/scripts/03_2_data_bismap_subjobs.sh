#!/bin/bash
#SBATCH --job-name=map
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH -n 1


##Zhenna Jiao
## 07 Dec 24 modified


#"L121-1" "L121-7" "L29-7"
# sample_list=("L29-1" "L29-4" "L30-2") ## 20241224 - 9:30 A.M.
# sample_list=("L30-2") ## 20241224 - 9:50 A.M.

# sample_list=("L121-1" "L121-7" "L29-7") ## 20241226 - 9:31 A.M.

# ref=/home/jiaozhenna/methylation/ref/bis_ref/

# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data/

# ptemp_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/temp

# input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/02_trimmed_data

# for sample in ${sample_list[@]}
# do

# sbatch  --mem=240G --job-name=map_${sample} /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/03_1_data_bismap_main.sh $sample $input_dir $out_dir $ref $ptemp_dir

# done



##modified by Zhenna Jiao on 20250102 to annalysis the add data
sample_list=("L29-4_new" "L30-2_new")

ref=/home/jiaozhenna/methylation/ref/bis_ref/

out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/03_mapped_data/

ptemp_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/temp

input_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/02_trimmed_data
shell_script=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/scripts/03_1_data_bismap_main.sh
for sample in ${sample_list[@]}
do

sbatch  --mem=240G --job-name=map_${sample} $shell_script $sample $input_dir $out_dir $ref $ptemp_dir

done






