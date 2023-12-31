% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lisths.R
\name{lisths}
\alias{lisths}
\title{lisths}
\usage{
library(ferroviz)

data(resulths)

data(ferrdbhs)

df<-lisths(resulths,ferrdbhs,fc=0.25)

df
}
\arguments{
\item{resulths}{output results of human differential expressed genes found with limma}

\item{ferrdbhs}{Homo sapiens ferrDB V2 database}

\item{fc}{threshold log2 fold change in absolute value}
}
\description{
the "liths" for Homo sapiens specie return annotated ferroptosis gene list
from limma output result between two groups of transcriptome experiments
}
\examples{
library(ferroviz)
data(resulths)
data(ferrdbhs)
df<-lisths(resulths,ferrdbhs,fc=0.25)
df
}
