#!/bin/bash
#SBATCH --job-name=dmr 
#SBATCH --partition cpu
#SBATCH -o /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH -e /home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/logs/%j_%x.log
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=2023206500042@whu.edu.cn
#SBATCH --mem-per-cpu=4G
#SBATCH --nodes=1
#SBATCH -n 16

## 15 Jan 2025 modified by Zhenna Jiao

module load bedtools/2.31.0


## formate sample cov_result to dmr_bed  

sample_list_1=("L15-3" "L15-4" "L15-1" "L15-2" "L15-5" "L15-7" "L29-2" "L29-6") ## bed_b_1
sample_list_2=("L30-1" "L30-5" "L30-6" "L127-6") ## bed_b_2
sample_list_3=("L29-1" "L29-7" "L30-2" "L121-7" "L121-1") 
sample_list_4=("L226-1" "L231-1" "L231-4") 

bed_a=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/results/DMR_delta_015_filtered_smaple_20250213_sorted_remove_blacklist.bed
bed_b_1=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20241221/results/05_call_meth_data
bed_b_2=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20250107/results/04_call_meth_data
bed_b_3=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/04_call_meth_data
bed_b_4=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20250121/results/04_call_meth_data
out_put_1=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/data/sample_bed_for_filter_smaple_20250213
out_put_2=/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/data/sample_bmeth_for_filter_smaple_20250213
mkdir -p ${out_put_1}
mkdir -p ${out_put_2}


for sample in "${sample_list_1[@]}" "${sample_list_2[@]}" "${sample_list_3[@]}" "${sample_list_4[@]}"
do 
   if [[ " ${sample_list_1[@]} " =~ " ${sample} " ]]; then
   
      bedtools map  -a ${bed_a} \
                  -b ${bed_b_1}/${sample}_L3_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz \
                  -c 5,6 -o sum,sum \
                  -null "NA" > ${out_put_1}/${sample}_dmr.bed

      awk '{if ($4!="NA" && $5!="NA" && ($4+$5)!=0) printf "%-10s%-10s%-10s%-10s%-10s%-10.3f\n", $1, $2, $3, $4, $5, $4/($4+$5); else printf "%-10s%-10s%-10s%-10s%-10s%-10s\n", $1, $2, $3, $4, $5, "NA"}' \
            ${out_put_1}/${sample}_dmr.bed > temp && mv temp ${out_put_2}/${sample}_dmr_meth.bed

   
   elif [[ " ${sample_list_2[@]} " =~ " ${sample} " ]]; then

      bedtools map  -a ${bed_a} \
                  -b ${bed_b_2}/${sample}_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz \
                  -c 5,6 -o sum,sum \
                  -null "NA" > ${out_put_1}/${sample}_dmr.bed

      awk '{if ($4!="NA" && $5!="NA" && ($4+$5)!=0) printf "%-10s%-10s%-10s%-10s%-10s%-10.3f\n", $1, $2, $3, $4, $5, $4/($4+$5); else printf "%-10s%-10s%-10s%-10s%-10s%-10s\n", $1, $2, $3, $4, $5, "NA"}' \
            ${out_put_1}/${sample}_dmr.bed > temp && mv temp ${out_put_2}/${sample}_dmr_meth.bed


   elif [[ " ${sample_list_3[@]} " =~ " ${sample} " ]]; then

      bedtools map  -a ${bed_a} \
                  -b ${bed_b_3}/${sample}_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz \
                  -c 5,6 -o sum,sum \
                  -null "NA" > ${out_put_1}/${sample}_dmr.bed

      awk '{if ($4!="NA" && $5!="NA" && ($4+$5)!=0) printf "%-10s%-10s%-10s%-10s%-10s%-10.3f\n", $1, $2, $3, $4, $5, $4/($4+$5); else printf "%-10s%-10s%-10s%-10s%-10s%-10s\n", $1, $2, $3, $4, $5, "NA"}' \
            ${out_put_1}/${sample}_dmr.bed > temp && mv temp ${out_put_2}/${sample}_dmr_meth.bed
   elif [[ " ${sample_list_4[@]} " =~ " ${sample} " ]]; then

      bedtools map  -a ${bed_a} \
                  -b ${bed_b_4}/${sample}_L2_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz \
                  -c 5,6 -o sum,sum \
                  -null "NA" > ${out_put_1}/${sample}_dmr.bed

      awk '{if ($4!="NA" && $5!="NA" && ($4+$5)!=0) printf "%-10s%-10s%-10s%-10s%-10s%-10.3f\n", $1, $2, $3, $4, $5, $4/($4+$5); else printf "%-10s%-10s%-10s%-10s%-10s%-10s\n", $1, $2, $3, $4, $5, "NA"}' \
            ${out_put_1}/${sample}_dmr.bed > temp && mv temp ${out_put_2}/${sample}_dmr_meth.bed
   else
      echo "sample name is not in the list"

   fi
   




done 

