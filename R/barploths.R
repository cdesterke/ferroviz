#' @title barploths

#' @description the "barploths" for Homo sapiens specie count differential expressed
#' genes regulated and implicated in ferroptosis (drivers and suppressors) from a limma
#' two groups analysis
#'
#' @param resulths output results of human differential expressed genes found with limma
#' @param ferrdbhs Homo sapiens ferrDB V2 database
#' @param fc threshold log2 fold change in absolute value
#' @param size size of the text in the figure
#' @usage library(ferroviz)
#' @usage data(resulths)
#' @usage data(ferrdbhs)
#' @usage barploths(resulths,ferrdbhs,fc=0.25,size=16)
#' @examples library(ferroviz)
#' @examples data(resulths)
#' @examples data(ferrdbhs)
#' @examples barploths(resulths,ferrdbhs,fc=0.25,size=16)


barploths<-function(resulths,ferrdbhs,fc=0.10,size=16){

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

  resulths%>%filter(adj.P.Val<=0.05 & abs(logFC)>=fc)%>%
    mutate(regulation=ifelse(logFC>=0,"up","down"))->sig

  sig$hs.gene<-row.names(sig)
  sig%>%left_join(ferrdbhs,by="hs.gene")->all
  all$class %>% replace_na('unclass')->all$class
  all%>%dplyr::rename(ferroptosis="class")->all
  all%>%filter(ferroptosis!="unclass")->all
  ggplot(all,aes(x=factor(regulation),fill=factor(ferroptosis)))+
    geom_bar(position="fill")+
    geom_text(aes(label=after_stat(count)),stat='count',position=position_fill(vjust=0.5),size=8,colour="white")+
    scale_fill_manual(values=c("tomato", "royalblue"))+
    xlab(paste0("LogFold change:  ",fc)) + ylab("relative proportions")+theme_classic()+
    theme(text = element_text(size = size))
}
