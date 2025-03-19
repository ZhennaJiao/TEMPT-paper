#!/bin/bash
#SBATCH --job-name=fmulti-qc
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/logs/%j_%x.log
#SBATCH --nodes=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH -n 4


##Zhenna Jiao 
## 07 Dec 24 modified 

### trimed data fastqc multiqc report
module load fastqc/0.12.1

# out_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_1x_data_20241206/results/01_fsatqc
# dat_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/01_fastqc

 trim_dir=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/02_trimmed_data

eval "$(conda shell.bash hook)"
conda activate /home/jiaozhenna/.conda/envs/meth

# multiqc ${dat_dir} -o ${dat_dir}/multiqc_report
 multiqc ${trim_dir} -o ${trim_dir}/multiqc_report

conda deactivate 
conda deactivate