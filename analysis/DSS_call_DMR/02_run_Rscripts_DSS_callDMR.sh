#!/bin/bash
#SBATCH --job-name=callDMR_filter_add_sample
#SBATCH --partition fat
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=25G
#SBATCH -n 8

## modified 20250109 
# fscript_callDMR=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_20250107/codes/01_DSS_callDMR_14_sample_20250109.r


#  /home/software/anaconda3/bin/Rscript $fscript_callDMR


 ## modified 20250114 by Zhenna Jiao
 fscript_callDMR=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/codes/01_1_DSS_callDMR_filter_added_sample_20250211.r

 /home/software/anaconda3/bin/Rscript $fscript_callDMR