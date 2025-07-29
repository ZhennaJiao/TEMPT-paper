 # Whole-genome methylation profiling of extracellular vesicle DNA in gastric cancer identifies intercellular communication features
 
 Authors: Bingqian Lin<sup>1* </sup>, Zhenna Jiao<sup>2* </sup>, Shouquan Dong<sup>3* </sup>, Weikai Yan<sup>1 </sup>, Jinting Jiang<sup>1 </sup>, Yanfang Du<sup>1 </sup>, Xiaocheng Weng<sup>1† </sup>, Hongling Wang<sup>3† </sup>, Zhiyuan Hu<sup>2† </sup>, Yibin Liu<sup>1† </sup>, Xiang Zhou<sup>1† </sup>  
 
 Affiliations:
 1 State Key Laboratory of Metabolism and Regulation in Complex Organisms, College of Chemistry and Molecular Sciences, Taikang Center for Life and Medical Sciences, Wuhan University, Wuhan 430072, China
 
 2 Department of Gynaecology and Obstetrics, Medical Research Institute, Frontier Science Center for Immunology and Metabolism, Zhongnan Hospital of Wuhan University, Wuhan University, Wuhan 430072, China
 
 3 Department of Gastroenterology of Zhongnan hospital of Wuhan University, Wuhan 430071, China
 
 *These authors contributed equally to this work. 
 
 †Correspondence to E-mail: xzhou@whu.edu.cn, liuyibin@whu.edu.cn, zhiyuan.hu@whu.edu.cn, zhnwhl@163.com, xcweng@whu.edu.cn.
 
 ## Data Preprocessing workflow 
 
 **Description:**
 * Preprocessing TEMPT data.
 * Located in the directory 'preprocessing/.'.
 * The pipeline consists of multiple steps, from quality control to methylation site calling.
 
 **Steps included:**
 1. **Quality Control of Raw Data**  
    Perform quality control on the raw sequencing data using FastQC.  
    **Script:** `01_data_fastqc.sh`
    
 3. **Trimming of Raw Reads**  
    Trim adapter sequences and low-quality bases from the reads.  
    **Script:** `02_data_trim.sh`
    
 4. **Mapping to Reference Genome**  
    Align trimmed reads to the reference genome using bisulfite-aware mapping tools.  
    **Script:** `03_data_bismap.sh`
 
 5. **Removing Duplicates**  
    Deduplicate mapped reads to remove PCR duplicates.  
    **Script:** `04_data_dedup.sh`
 
 6. **Methylation Calling**  
    Extract methylation information from the deduplicated BAM files.  
    **Script:** `05_data_call_meth.sh`
 
 7. **Coverage Calculation**  
    Assess the coverage depth of the sequencing data.  
    **Script:** `06_data_breadth_coverage.sh`
 
 8. **Extracting Spike-In Controls**  
    Extract spike-in sequences from the mapped data.  
    **Scripts:**  
    - `07_extract_spike_in_main.sh`  
    - `07_extract_spike_in_subjobs.sh`
 
 9. **Methylation Calling for Spike-In Data**  
    Call methylation sites specifically for spike-in control sequences.  
    **Scripts:**  
    - `08_call_spike_in_meth_main.sh`  
    - `08_call_spike_in_meth_subjobs.sh`
 
 10. **Spike-In Methylation Conversion Analysis**  
    Compute the methylation conversion rates of spike-in controls.  
    **Script:** `09_data_spkin.Rmd`
 
 ## Downstream Analysis
 
 The following analyses were performed based on methylation calling results. The corresponding scripts are located in the `analysis/` directory.
 
 ### 1. Call DMRs
 
 Using the [DSS package](http://bioconductor.org/packages/release/bioc/html/DSS.html) to identify differentially methylated regions:
 
 - Directory: `analysis/DSS_call_DMR/`
 
 ### 2. TOO Analysis
 
 Tissue deconvolution using NNLS regression:
 
 - Directory: `analysis/TOO_analysis/`
 
 ### 3. Visualization
 
 Code for generating figures shown in the paper:
 
 - Directory: `analysis/figures/`
 
 
 
 
 
 
 
 
