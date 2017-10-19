library(ggplot2)
library(scales)

#demo
months<-24
year1<-c(1338229205,5212325386,31725112511)
year3<-c(1372425378,8836570075,49574919628)
group<-c("Group C", "Group B", "Group A")
a<-data.frame(year1,year3,group)

l11<-paste(a$group,comma_format()(round(a$year1/(3600*24*30.5))),sep="\n")
l13<-paste(a$group,comma_format()(round(a$year3/(3600*24*30.5))),sep="\n")

#Drawing the slopelines
p<-ggplot(a) + geom_segment(aes(x=0,xend=months,y=year1,yend=year3),size=.75)

#remove chartjunk
p<-p + theme(panel.background = element_blank())
p<-p + theme(panel.grid=element_blank())
p<-p + theme(axis.ticks=element_blank())
p<-p + theme(axis.text=element_blank())
p<-p + theme(panel.border=element_blank())

#set axis labels and limits
p<-p + xlab("") + ylab("Amount Used")
###p<-p + theme(axis.title.y=theme_text(vjust=3))
p<-p + xlim((0-12),(months+12))
p<-p + ylim(0,(1.2*(max(a$year3,a$year1))))

#label slopelines
p<-p + geom_text(label=l13, y=a$year3, x=rep.int(months,length(a)),hjust=-0.2,size=3.5)
p<-p + geom_text(label=l11, y=a$year1, x=rep.int( 0,length(a)),hjust=1.2,size=3.5)

#label columns
p<-p + geom_text(label="Year 1", x=0,     y=(1.1*(max(a$year3,a$year1))),hjust= 1.2,size=5)
p<-p + geom_text(label="Year 3", x=months,y=(1.1*(max(a$year3,a$year1))),hjust=-0.1,size=5)

##########################

#actual data
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
####?p<-p + theme(axis.title.y=theme_text(vjust=3))
#p<-p + xlim((0-12),(months+12))			#aanpassen (en volgende) indien nodig
#p<-p + ylim(0,(1.2*(max(a$year3,a$year1))))

#HIER VERDER GAAN
# Voor morgen: months gewoon als 2? Of een andere integer?
p<-p + geom_text(label=l13, y=a$year3, x=rep.int(months,length(a)),hjust=-0.2,size=3.5)
p<-p + geom_text(label=l11, y=a$year1, x=rep.int( 0,length(a)),hjust=1.2,size=3.5)
p<-p + geom_text(label="Year 1", x=0,     y=(1.1*(max(a$year3,a$year1))),hjust= 1.2,size=5)
p<-p + geom_text(label="Year 3", x=months,y=(1.1*(max(a$year3,a$year1))),hjust=-0.1,size=5)
p