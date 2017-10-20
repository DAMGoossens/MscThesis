library(ggplot2)
library(scales)

temp = read.csv("vergelijking_kallisto_ballgown_transcripten.csv", sep=",", header=TRUE)
temp$X <- NULL
temp$X.1 <- NULL
temp <- data.frame(temp)

l11 <- paste(temp$transcript, comma_format()(round(temp$kallisto)), sep="\n")
l13 <- paste(temp$transcript, comma_format()(round(temp$stringtie)), sep="\n")
p<-ggplot(temp) + geom_segment(aes(x=0,xend=0.05,y=stringtie,yend=kallisto), size=0.75)

p<-p + theme(panel.background = element_blank())
p<-p + theme(panel.grid=element_blank())
p<-p + theme(axis.ticks=element_blank())
p<-p + theme(axis.text=element_blank())
p<-p + theme(panel.border=element_blank())

p<-p + xlab("Transcripts") + ylab("")
p
