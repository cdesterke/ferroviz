#' @title mmvol

#' @description the "mmvol" function allows to draw volcanoplot of ferroptosis genes
#' (red: drivers) (blue: suppressors), from a limma output between 2 experimental
#' groups (Mus musculus).
#'
#' @param resulths output results of human differential expressed genes found with limma
#' @param ferrdbhs Homo sapiens ferrDB V2 database
#' @param color color of gene dots unclassed in ferrdb
#' @param size size of the text in the figure
#' @param x x coordinates of logFC for vertical lines
#' @param label size of text gene labels
#' @usage library(ferroviz)
#' @usage data(resultmm)
#' @usage data(ferrdbmm)
#' @usage mmvol(resultmm,ferrdbmm,color="grey",size=16,x=0.25,label=1.5)
#' @examples library(ferroviz)
#' @examples data(resultmm)
#' @examples data(ferrdbmm)
#' @examples mmvol(resultmm,ferrdbmm,color="grey",size=16,x=0.25,label=1.5)


mmvol<-function(resultmm,ferrdbmm,color="grey",size=16,x=0.25,label=1.5){
  if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
  }
  if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
  }
  if(!require(ggrepel)){
    install.packages("ggrepel")
    library(ggrepel)
  }
  if(!require(tidyr)){
    install.packages("tidyr")
    library(tidyr)
  }

  resultmm$NLP<- -log(resultmm$P.Value,10)
  resultmm$gene.mm<-row.names(resultmm)
  resultmm%>%left_join(ferrdbmm,by="gene.mm")->all


  all$class %>% replace_na('unclass')->all$class
  all%>%dplyr::rename(ferroptosis="class")->all
  ff <- function(x){ifelse(x != "unclass", 2, 1)}
  df <- all%>% filter(ferroptosis != "unclass")
  ggplot(data=all, aes(x=logFC, y=NLP, col=ferroptosis, label=gene.mm)) +
    geom_point(alpha=0.5,aes(size = ff(ferroptosis))) +
    theme_minimal()+
    scale_color_manual(values=c("tomato", "royalblue", color)) +
    geom_vline(xintercept=c(-x, x), col="orange",linetype="dashed") +
    geom_text_repel(data=df,aes(x=logFC, y=NLP,label=gene.mm,size=label))+
    theme(text = element_text(size = size))+
    xlab("log2 Fold Change")+ylab("Negative log10 P-values")+
    theme(legend.position="none")
}
