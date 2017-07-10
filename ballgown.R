source("http://www.bioconductor.org/biocLite.R")
biocLite(c("ballgown", "genefilter","dplyr","devtools"))
library(devtools) 
devtools::install_github('alyssafrazee/RSkittleBrewer', force = TRUE)
library(ballgown)
library(RSkittleBrewer) 
library(genefilter)
library(dplyr)


getwd()
#setwd("/mnt/scratch/gooss032/o_stringtie")

#importeren
pheno_data = read.csv("ballgown/samplesR.csv", header=TRUE)
bg = ballgown(dataDir = "ballgown", samplePattern="1657", pData=pheno_data)
#bg_filt = subset(bg,"rowVars(texpr(bg)) >1",genomesubset=FALSE)

#testing
diffEx_transcripts = stattest(bg, feature="transcript", covariate="condition", getFC=TRUE, meas="FPKM")
genes.fpkm = gexpr(bg)
genes.fpkm.log = log2(genes.fpkm+1)
transcripts.fpkm = texpr(bg)
transcripts.fpkm.log= log2(transcripts.fpkm+1)