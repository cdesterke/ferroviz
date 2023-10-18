# ferroviz
## ferroviz: a R-package to perform visualization of ferroptosis related genes in a transcriptome differential expressed gene analysis output from limma algorithm





### package installation
```r
library(devtools)
install_github("cdesterke/ferroviz")
```
### description
ferroviz is a R-package based on ferrdb v2 database (Zhou et al. 2023) which highlight ferroptosis related genes in a differential expressed gene analysis between two experimental conditions output from the limma algorithm (Ritchie et al. 2015). With biomart gene conversion between Homo sapiens and Mus musculus (Cunningham et al. 2022) possible to applied analyses to these two species.


# HUMAN ANALYSES
For human analyses taken as example to employ ferroviz package, transcriptome RNA-seq from dataset GSE173905 was processed (Li P. 2022). During these transcriptome experiments, MDA-MB-231 cells were treated or not with erastin. FPKM were transformed in pseudocounts before differential expressed gene analysis with limma R-package. Output results from limma algorithm were treated with ferroviz package for downstream analyses foccused on ferroptosis related genes.

### volcanoplot of human limma output (drivers in red and suppressors in blue)
```r
library(ferroviz)
data(resulths)
data(ferrdbhs)
hsvol(resulths,ferrdbhs,color="grey",size=16,x=0.25,label=1.5)
```
![res](https://github.com/cdesterke/ferroviz/blob/main/volhs.png)


### barplot of human regulation for ferroptosis related genes

```r
library(ferroviz)
data(resulths)
data(ferrdbhs)
barploths(resulths,ferrdbhs,fc=0.25,size=16)
```
![res](https://github.com/cdesterke/ferroviz/blob/main/barploths.png)


### output human significant ferroptosis related genes

```r
library(ferroviz)
data(resulths)
data(ferrdbhs)
df<-lisths(resulths,ferrdbhs,fc=0.25)
df
```
![res](https://github.com/cdesterke/ferroviz/blob/main/lisths.png)


# MURINE ANALYSES

For murine analyses, RNA-seq raw counts from GSE166536 dataset were employed to highlight the regulation of ferroptosis related genes (Fox et al. 2021). During these transcriptome experiments 4T1 cells were treated or not with 10nM docetaxel 24hr. Raw counts were voom transformed with EdgeR R-package (Robinson, McCarthy, et Smyth 2010) before differential expressed gene analysis with limma R-package. Output results from limma algorithm were treated with ferroviz package for downstream analyses foccused on ferroptosis related genes.

### volcanoplot of murine limma output (drivers in red and suppressors in blue)
```r
library(ferroviz)
data(resultmm)
data(ferrdbmm)
mmvol(resultmm,ferrdbmm,color="grey",size=16,x=0.25,label=1.5)
```
![res](https://github.com/cdesterke/ferroviz/blob/main/volmm.png)


### barplot of murine regulation for ferroptosis related genes

```r
library(ferroviz)
data(resultmm)
data(ferrdbmm)
barplotmm(resultmm,ferrdbmm,fc=0.25,size=16)
```
![res](https://github.com/cdesterke/ferroviz/blob/main/barplotmm.png)


### output murine significant ferroptosis related genes

```r
library(ferroviz)
data(resultmm)
data(ferrdbmm)
df<-listmm(resultmm,ferrdbmm,fc=0.10)
df
```
![res](https://github.com/cdesterke/ferroviz/blob/main/listmm.png)

### REFERENCES

> Zhou, Nan, Xiaoqing Yuan, Qingsong Du, Zhiyu Zhang, Xiaolei Shi, Jinku Bao, Yuping Ning, et Li Peng. 2023. « FerrDb V2: Update of the Manually Curated Database of Ferroptosis Regulators and Ferroptosis-Disease Associations ». Nucleic Acids Research 51 (D1): D571‑82. https://doi.org/10.1093/nar/gkac935.

> Ritchie, Matthew E., Belinda Phipson, Di Wu, Yifang Hu, Charity W. Law, Wei Shi, et Gordon K. Smyth. 2015. « Limma Powers Differential Expression Analyses for RNA-Sequencing and Microarray Studies ». Nucleic Acids Research 43 (7): e47. https://doi.org/10.1093/nar/gkv007.

> Cunningham, Fiona, James E Allen, Jamie Allen, Jorge Alvarez-Jarreta, M Ridwan Amode, Irina M Armean, Olanrewaju Austine-Orimoloye, et al. 2022. « Ensembl 2022 ». Nucleic Acids Research 50 (D1): D988‑95. https://doi.org/10.1093/nar/gkab1049.

> Li, Pengyun, Qiaohong Lin, Shiyang Sun, Ning Yang, Yu Xia, Shengjie Cao, Wenjuan Zhang, et al. 2022. « Inhibition of Cannabinoid Receptor Type 1 Sensitizes Triple-Negative Breast Cancer Cells to Ferroptosis via Regulating Fatty Acid Metabolism ». Cell Death & Disease 13 (9): 808. https://doi.org/10.1038/s41419-022-05242-5.

> Fox, Gregory C., Xinming Su, Jennifer L. Davis, Yalin Xu, Kristin A. Kwakwa, Michael H. Ross, Francesca Fontana, et al. 2021. « Targeted Therapy to Β3 Integrin Reduces Chemoresistance in Breast Cancer Bone Metastases ». Molecular Cancer Therapeutics 20 (6): 1183‑98. https://doi.org/10.1158/1535-7163.MCT-20-0931.

> Robinson, Mark D., Davis J. McCarthy, et Gordon K. Smyth. 2010. « edgeR: A Bioconductor Package for Differential Expression Analysis of Digital Gene Expression Data ». Bioinformatics (Oxford, England) 26 (1): 139‑40.

