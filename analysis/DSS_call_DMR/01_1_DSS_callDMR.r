#### 2025-01-14 modified by Zhenna Jiao
### call DMR for added sample 
##use DSS to call DMR 
library(DSS)
require(bsseq)
library(data.table)
library(magrittr)
library(readxl)
library(matrixStats)

dat_met <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/metadata/sample_metadata_20250207.xlsx"
meta <- read_excel(dat_met,sheet = "filter_added_sample")
##
print(meta$Sample)

meta$Sample_name <- paste0(meta$Sample,"_",meta$Sample_ID)
meta$type <- substr(meta$Sample,1,2)

print(meta$Sample_name)



## read call meth results and store in a list 
proj_dir_1 <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20241221/results/05_call_meth_data/"
proj_dir_2 <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/smaple_30x_data_202412/results/04_call_meth_data/"
proj_dir_3 <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20250107/results/04_call_meth_data/"
proj_dir_4 <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/reprocessing/sample_30x_data_20250121/results/04_call_meth_data/"
#create a blank list to store the data frame 
current_sample_data_list <- list()

## print("read bismark output and convert format...")
for (i_sample in meta$Sample_name) {

  sample_prefix <- strsplit(i_sample, "_")[[1]][1]
  sample_suffix <- strsplit(i_sample, "_")[[1]][2]

  file_path_1 <- paste0(proj_dir_1,sample_suffix,"_L3_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz")
  file_path_2 <- paste0(proj_dir_2,sample_suffix,"_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz")
  file_path_3 <- paste0(proj_dir_3,sample_suffix,"_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz")
  file_path_4 <- paste0(proj_dir_4,sample_suffix,"_L2_1_val_1_bismark_bt2_pe.deduplicated.bismark.cov.gz")
  
  df_tmp <- NULL
  ## check the different file path
  if(file.exists(file_path_1)){
    df_tmp <- data.table::fread(file_path_1,sep = '\t', header = FALSE,  # import the bismark coverage data.
                                col.names = c("chr", "start_coordinate", "pos", "Bs_methylation_percentage", "X", "number_of_unmethylation_base"))
    print(paste0("The code run to ", sample_suffix, " in proj_dir_1"))

  }else if (file.exists(file_path_2)){

    df_tmp <- data.table::fread(file_path_2,sep = '\t', header = FALSE,  # import the bismark coverage data.
                                col.names = c("chr", "start_coordinate", "pos", "Bs_methylation_percentage", "X", "number_of_unmethylation_base"))
    print(paste0("The code run to ", sample_suffix, " in proj_dir_2"))

  }else if (file.exists(file_path_3)){
    
    df_tmp <- data.table::fread(file_path_3,sep = '\t', header = FALSE,  # import the bismark coverage data.
                                col.names = c("chr", "start_coordinate", "pos", "Bs_methylation_percentage", "X", "number_of_unmethylation_base"))
    print(paste0("The code run to ", sample_suffix, " in proj_dir_3"))
    
  }else if (file.exists(file_path_4)){
    
    df_tmp <- data.table::fread(file_path_4,sep = '\t', header = FALSE,  # import the bismark coverage data.
                                col.names = c("chr", "start_coordinate", "pos", "Bs_methylation_percentage", "X", "number_of_unmethylation_base"))
    print(paste0("The code run to ", sample_suffix, " in proj_dir_4"))
    
  }else {
    print(paste0("No file find for sample",sample_suffix))
    next
  }

  if(!is.null(df_tmp)){

    df_tmp$N <- df_tmp$X+df_tmp$`number_of_unmethylation_base` ##N means the total coverage unmeth+meth

    a <- data.frame(chr = df_tmp$chr, pos = df_tmp$pos, N = df_tmp$N, X = df_tmp$X) #make DSS txt

    b <- a[a$chr %in% paste0("chr",1:22),]

    current_sample_data_list[[sample_prefix]] <- b ##save data frame to the list

  }

}
results_dir <- "/home/jiaozhenna/methylation/project/EM_seq/20241125_data_reanalysis/Call_DMR_filter_add_sample_20250213/results/"

saveRDS(current_sample_data_list,file =paste0(results_dir,"EMobject_filter_added_sample_20250213_data_list.rds"))



##make group for samples 
gp_group <- c(meta$Sample[meta$type == "gp"])


gc_group <- c(meta$Sample[meta$type == "gc"])



# print("make bsseq data")

EMobject_fs <- makeBSseqData(current_sample_data_list,c(names(current_sample_data_list)))


saveRDS(EMobject_fs,file =paste0(results_dir,"EMobject_filter_added_sample_20250213.rds")) 


print("dml test")

dmlTest <- DMLtest(EMobject_fs,group1 =gp_group,group2 = gc_group,ncores=8,smoothing=TRUE)

saveRDS(dmlTest,paste0(results_dir,"dmlTest_filter_added_sample_20250213.rds"))
        

##call dmr 

print("call dmr delts=0.15")
dmrs = callDMR(dmlTest, delta=0.15, p.threshold=0.05)

saveRDS(dmrs,paste0(results_dir,"callDMR_delta_015_filter_added_sample_20250213.rds"))

print("call dml")

dmls = callDML(dmlTest, p.threshold=0.05)

saveRDS(dmls,paste0(results_dir,"callDML_filter_added_sample_20250213.rds"))


print(sessionInfo())
