% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/barploths.R
\name{barploths}
\alias{barploths}
\title{barploths}
\usage{
library(ferroviz)

data(resulths)

data(ferrdbhs)

barploths(resulths,ferrdbhs,fc=0.25,size=16)
}
\arguments{
\item{resulths}{output results of human differential expressed genes found with limma}

\item{ferrdbhs}{Homo sapiens ferrDB V2 database}

\item{fc}{threshold log2 fold change in absolute value}

\item{size}{size of the text in the figure}
}
\description{
the "barploths" for Homo sapiens specie count differential expressed
genes regulated and implicated in ferroptosis (drivers and suppressors) from a limma
two groups analysis
}
\examples{
library(ferroviz)
data(resulths)
data(ferrdbhs)
barploths(resulths,ferrdbhs,fc=0.25,size=16)
}
