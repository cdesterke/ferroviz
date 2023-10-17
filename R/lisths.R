#' @title lisths

#' @description the "liths" for Homo sapiens specie return annotated ferroptosis gene list
#' from limma output result between two groups of transcriptome experiments
#'
#' @param resulths output results of human differential expressed genes found with limma
#' @param ferrdbhs Homo sapiens ferrDB V2 database
#' @param fc threshold log2 fold change in absolute value
#' @usage library(ferroviz)
#' @usage data(resulths)
#' @usage data(ferrdbhs)
#' @usage df<-lisths(resulths,ferrdbhs,fc=0.25)
#' @usage df
#' @examples library(ferroviz)
#' @examples data(resulths)
#' @examples data(ferrdbhs)
#' @examples df<-lisths(resulths,ferrdbhs,fc=0.25)
#' @examples df


lisths<-function(resulths,ferrdbhs,fc=0.10){

  if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
  }


  resulths%>%filter(adj.P.Val<=0.05 & abs(logFC)>=fc)%>%
    mutate(regulation=ifelse(logFC>=0,"up","down"))->sig

  sig$hs.gene<-row.names(sig)
  sig%>%left_join(ferrdbhs,by="hs.gene")->all
  all$class %>% replace_na('unclass')->all$class
  all%>%dplyr::rename(ferroptosis="class")->all
  all%>%filter(ferroptosis!="unclass")->all
  return(all)
}

