# Deconvolute Cell Types
Nextflow pipeline for cell type deconvolution sub-group of ICGC-ARGO RNA-seq Working Group. Works with docker.

## 🚧 Work In Progress 🚧

Here the deconvolution of cell types aims to estimate computationally the proportion of cells that we have within one tumour rna-seq sample.
A list of methods is implemented here for ICGC-ARGO RNA-seq working group.


### Requirements
* Python >= 3.6
* pip >= 20.0
* Nextflow >= 20.10
* Docker >= 19.0

# Tools
List of methods that are or will be implemented.

### Implemented

+ MCPCounter

### TODO

+ CIBERSORT
+ EPIC
+ ESTIMATE
+ ConsensusTME



## Literature

+ [\[Review\] Benchmarking of cell type deconvolution pipelines for transcriptomics data](https://www.nature.com/articles/s41467-020-19015-1)
+ [\[MCPCounter\] Estimating the population abundance of tissue-infiltrating immune and stromal cell populations using gene expression](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-1070-5)
+ [\[CIBERSORT\] Profiling tumor infiltrating immune cells with CIBERSORT](https://doi.org/10.1007/978-1-4939-7493-1_12)
+ [\[EPIC\] EPIC: A Tool to Estimate the Proportions of Different Cell Types from Bulk Gene Expression Data](https://doi.org/10.1007/978-1-0716-0327-7_17)
+ [\[ConsensusTME\] Comprehensive Benchmarking and Integration of Tumor Microenvironment Cell Estimation Methods](https://cancerres.aacrjournals.org/content/79/24/6238)
