# TEMPT-seq Data Reprocessing Workflow

This repository provides a streamlined workflow for processing TEMPT-seq data. The pipeline consists of multiple steps, from quality control to methylation analysis. Below is a step-by-step guide to the scripts used in the workflow.

## Workflow Steps

1. **Quality Control of Raw Data**  
   Perform quality control checks on the raw sequencing data using FastQC.  
   **Script:** `01_data_fastqc.sh`

2. **Trimming of Raw Reads**  
   Trim adapter sequences and low-quality bases from the reads.  
   **Script:** `02_data_trim.sh`

3. **Mapping to Reference Genome**  
   Align trimmed reads to the reference genome using bisulfite-aware mapping tools.  
   **Script:** `03_data_bismap.sh`

4. **Removing Duplicates**  
   Deduplicate mapped reads to remove PCR duplicates.  
   **Script:** `04_data_dedup.sh`

5. **Methylation Calling**  
   Extract methylation information from the deduplicated BAM files.  
   **Script:** `05_data_call_meth.sh`

6. **Coverage Calculation**  
   Assess the coverage depth of the sequencing data.  
   **Script:** `06_data_breath_coverage.sh`

7. **Extracting Spike-In Controls**  
   Extract spike-in sequences from the mapped data.  
   **Scripts:**  
   - `07_extract_spike_in_main.sh`  
   - `07_extract_spike_in_subjobs.sh`

8. **Methylation Calling for Spike-In Data**  
   Call methylation levels specifically for spike-in control sequences.  
   **Scripts:**  
   - `08_call_spike_in_meth_main.sh`  
   - `08_call_spike_in_meth_subjobs.sh`

9. **Spike-In Methylation Conversion Analysis**  
   Compute the methylation conversion rates of spike-in controls.  
   **Script:** `09_data_spkin.Rmd`

## How to Use

Run the scripts sequentially in the given order. Each script processes a specific stage of the workflow. Ensure all dependencies are installed before running the scripts.

## Dependencies

- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [Trim Galore](https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/)
- [Bismark](https://www.bioinformatics.babraham.ac.uk/projects/bismark/)
- Samtools
- R for downstream analysis

## Contact

For questions or troubleshooting, feel free to open an issue or reach out to the repository maintainer.



