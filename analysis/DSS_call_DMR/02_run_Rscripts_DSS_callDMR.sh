#!/bin/bash
# fscript_callDMR=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_20250107/codes/01_DSS_callDMR_14_sample_20250109.r

 ## modified 20250114 by Zhenna Jiao
 fscript_callDMR=$HOME/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/codes/01_1_DSS_callDMR_filter_added_sample_20250211.r

 /home/software/anaconda3/bin/Rscript $fscript_callDMR
