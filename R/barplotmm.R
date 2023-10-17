#' @title barplotmm

#' @description the "barplotmm" for Mus musculus specie count differential expressed
#' genes regulated and implicated in ferroptosis (drivers and suppressors) from a limma
#' two groups analysis
#'
#' @param resultmm output results of murine differential expressed genes found with limma
#' @param ferrdbmm Mus musculus ferrDB V2 database
#' @param fc threshold log2 fold change in absolute value
#' @param size size of the text in the figure
#' @usage library(ferroviz)
#' @usage data(resultmm)
#' @usage data(ferrdbmm)
#' @usage barplotmm(resultmm,ferrdbmm,fc=0.25,size=16)
#' @examples library(ferroviz)
#' @examples data(resultmm)
#' @examples data(ferrdbmm)
#' @examples barplotmm(resultmm,ferrdbmm,fc=0.25,size=16)



barplotmm<-function(resultmm,ferrdbmm,fc=0.10,size=16){

  if(!require(ggplot2)){
    install.packages("ggplot2")
    library(ggplot2)
  }
  if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
  }
  if(!require(tidyr)){
    install.packages("tidyr")
    library(tidyr)
  }



    resultmm%>%filter(adj.P.Val<=0.05 & abs(logFC)>=fc)%>%
    mutate(regulation=ifelse(logFC>=0,"up","down"))->sig

    sig$gene.mm<-row.names(sig)
    sig%>%left_join(ferrdbmm,by="gene.mm")->all
    all$class %>% replace_na('unclass')->all$class
    all%>%dplyr::rename(ferroptosis="class")->all
    all%>%filter(ferroptosis!="unclass")->all

    ggplot(all,aes(x=factor(regulation),fill=factor(ferroptosis)))+
    geom_bar(position="fill")+
    geom_text(aes(label=after_stat(count)),stat='count',position=position_fill(vjust=0.5),size=8,colour="white")+
    scale_fill_manual(values=c("tomato", "royalblue"))+
    xlab(paste0("Fold change:  ",fc)) + ylab("relative proportions")+theme_classic()+theme(text = element_text(size = size))
}
