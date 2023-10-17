#' @title listmm

#' @description the "litmm" for Mus musculus specie return annotated ferroptosis gene list
#' from limma output result between two groups of transcriptome experiments
#'
#' @param resultmm output results of human differential expressed genes found with limma
#' @param ferrdbmm Homo sapiens ferrDB V2 database
#' @param fc threshold log2 fold change in absolute value
#' @usage library(ferroviz)
#' @usage data(resultmm)
#' @usage data(ferrdbmm)
#' @usage df<-listmm(resultmm,ferrdbmm,fc=0.10)
#' @usage df
#' @examples library(ferroviz)
#' @examples data(resultmm)
#' @examples data(ferrdbmm)
#' @examples df<-listmm(resultmm,ferrdbmm,fc=0.10)
#' @examples df



listmm<-function(resultmm,ferrdbmm,fc=0.10){


  if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
  }


  resultmm%>%filter(adj.P.Val<=0.05 & abs(logFC)>=fc)%>%
    mutate(regulation=ifelse(logFC>=0,"up","down"))->sig

  sig$gene.mm<-row.names(sig)
  sig%>%left_join(ferrdbmm,by="gene.mm")->all
  all$class %>% replace_na('unclass')->all$class
  all%>%dplyr::rename(ferroptosis="class")->all
  all%>%filter(ferroptosis!="unclass")->all
  return(all)
}
