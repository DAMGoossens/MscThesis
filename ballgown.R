source("http://www.bioconductor.org/biocLite.R")
biocLite(c("ballgown", "genefilter","dplyr","devtools"))
install.packages("ggfortify")
library(devtools) 
devtools::install_github('alyssafrazee/RSkittleBrewer', force = TRUE)
library(ballgown)
library(RSkittleBrewer) 
library(genefilter)
library(dplyr)
library(ggfortify)

getwd()
setwd("/mnt/scratch/gooss032/o_stringtie")

#importeren
pheno_data = read.csv("ballgown/samplesR.csv", header=TRUE)
bg = ballgown(dataDir = "ballgown", samplePattern="1657", pData=pheno_data)

#testing
#diffEx_transcripts = stattest(bg, feature="transcript", covariate="condition", getFC=TRUE, meas="FPKM")
#genes.fpkm = gexpr(bg)
#genes.fpkm.log = log2(genes.fpkm+1)
#transcripts.fpkm = texpr(bg)
#transcripts.fpkm.log= log2(transcripts.fpkm+1)

#testing statistical significance
#bg_filt = subset(bg,"rowVars(texpr(bg)) >1",genomesubset=TRUE)
results_transcripts = stattest(bg_filt, feature="transcript", meas="FPKM", covariate="condition", getFC=TRUE, libadjust=FALSE)     #geld alleen maar voor verschil tussen twee groepen. 
results_genes = stattest(bg_filt, feature="gene", meas="FPKM", covariate="condition", getFC=TRUE, libadjust=FALSE)
results_transcripts = data.frame(geneNames=ballgown:geneNames(bg),geneIDs=ballgown:geneIDs(bg),results_transcripts)

#sorteren op p-value en q-value
results_transcripts = arrange(results_transcripts,pval)
results_genes = arrange(results_genes,pval)
write.csv(results_transcripts,"stringtie_transcript_results.csv",row.names=FALSE)
write.csv(results_genes,"stringtie_genes_results.csv",row.names=FALSE)
subset(results_transcripts,results_transcripts$qval<0.05)
subset(results_genes,results_genes$qval<0.05)

#visualization of fpkm and such
tropical=c('darkorange', 'dodgerblue', 'hotpink', 'limegreen', 'yellow')
palette(tropical)
fpkm = texpr(bg,meas="FPKM")
fpkm=log2(fpkm+1)
boxplot(fpkm,col=as.numeric(pheno_data$condition), las=2, ylab='log2(FPKM+1)')
plotMeans('AT1G52740', bg_filt,groupvar="condition",legend=FALSE)
plot(-log10(pval)~log2(fc),data=results_genes,main="Volcano plot")

fpkm.cor = cor(fpkm)
rownames(fpkm.cor) = gsub("FPKM.","",rownames(fpkm.cor))
heatmap(fpkm.cor, scale = c("none"))  #scale is either row (default), symm (false) or none

df.fpkm = as.data.frame(t(fpkm))
rownames(df.fpkm) =gsub("FPKM.","",rownames(df.fpkm))

#fpkm[is.na(fpkm)]<-0

#PCA
fpkm = log2(gexpr(bg)+1)

df.fpkm = as.data.frame(t(fpkm))

rownames(df.fpkm) =gsub("FPKM.","",rownames(df.fpkm))

df.fpkm$condition =  pheno_data$condition

autoplot(prcomp(t(fpkm)), data=df.fpkm, colour='condition', label=TRUE,label.vjust=2,label.size=3)