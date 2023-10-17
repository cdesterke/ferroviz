# ferroviz
## ferroviz: a R-package to perform visualization of ferroptosis related genes in a transcriptome differential expressed gene analysis output from limma algorithm





### package installation
```r
library(devtools)
install_github("cdesterke/ferroviz")
```
### description
ferroviz is a R-package based on ferrdb v2 database which highlight ferroptosis related in a differential expressed gene analysis output from limma algorithm. With biomart gene conversion between Homo sapiens and Mus musculus is possible to applied analyses to these two species.

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
