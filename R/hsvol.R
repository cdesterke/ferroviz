#' @title hsvol

#' @description the "hsvol" function allows to draw volcanoplot of ferroptosis genes
#' (red: drivers) (blue: suppressors), from a limma output between 2 experimental
#' groups (Homo sapiens).
#'
#' @param resulths output results of human differential expressed genes found with limma
#' @param ferrdbhs Homo sapiens ferrDB V2 database
#' @param color color of gene dots unclassed in ferrdb
#' @param size size of the text in the figure
#' @param x x coordinates of logFC for vertical lines
#' @param label size of text gene labels
#' @usage library(ferroviz)
#' @usage data(resulths)
#' @usage data(ferrdbhs)
#' @usage hsvol(resulths,ferrdbhs,color="grey",size=16,x=0.25,label=1.5)
#' @examples library(ferroviz)
#' @examples data(resulths)
#' @examples data(ferrdbhs)
#' @examples hsvol(resulths,ferrdbhs,color="grey",size=16,x=0.25,label=1.5)



hsvol<-function(resulths,ferrdbhs,color="grey",size=16,x=0.5,label=1.5){

  #install require R packages if necessary and load them
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



  resulths$NLP<- -log(resulths$P.Value,10)
  resulths$hs.gene<-row.names(resulths)
  resulths%>%left_join(ferrdbhs,by="hs.gene")->all


  all$class %>% replace_na('unclass')->all$class
  all%>%dplyr::rename(ferroptosis="class")->all

  ff <- function(x){ifelse(x != "unclass", 2, 1)}

  df <- all%>% filter(ferroptosis != "unclass")

  ggplot(data=all, aes(x=logFC, y=NLP, col=ferroptosis, label=hs.gene)) +
    geom_point(alpha=0.5,aes(size = ff(ferroptosis))) +
    theme_minimal()+
    scale_color_manual(values=c("tomato", "royalblue", color)) +
    geom_vline(xintercept=c(-x, x), col="orange",linetype="dashed") +
    geom_text_repel(data=df,aes(x=logFC, y=NLP,label=hs.gene,size=label))+
    theme(text = element_text(size = size))+
    xlab("log2 Fold Change")+ylab("Negative log10 P-values")+
    theme(legend.position="none")
}


