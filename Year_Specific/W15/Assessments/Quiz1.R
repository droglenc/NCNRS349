## Schematic for the fitPlot question
par(mar=c(4,4,0.2,0.2),mgp=c(1.7,0.5,0),tcl=-0.4)
plot(-5,xlim=c(0.7,4.3),ylim=c(0,12),xaxt="n",yaxt="n",xlab="",ylab="")
axis(1,1:4,labels=FALSE)
axis(2,0:15,labels=FALSE)

## The results for the one-way ANOVA question
## Data from http://sirismm.si.edu/ctfs/Dallingetal1998Ecology.pdf
setwd("C:/aaaWork/Class Materials/MTH207/Year_Specific/W15/Assessments")

library(NCStats)
library(multcomp)
d <- read.csv("SoilSeed.csv")
d$dist <- factor(d$dist)
lm1 <- lm(dens~dist,data=d)
transChooser(lm1)
anova(lm1)
summary(lm1)
mc1 <- glht(lm1,mcp(dist="Tukey"))
summary(mc1)
confint(mc1)

d$logdens <- log(d$dens)
lm2 <- lm(logdens~dist,data=d)
transChooser(lm2)
anova(lm2)
summary(lm2)
mc2 <- glht(lm2,mcp(dist="Tukey"))
summary(mc2)
confint(mc2)

## p-values for the two-way table
distrib(0.145,distrib="f",df1=3,df2=19,lower.tail=FALSE)
distrib(5.992,distrib="f",df1=1,df2=19,lower.tail=FALSE)
distrib(0.466,distrib="f",df1=3,df2=19,lower.tail=FALSE)

## The two-way ANOVA interaction plots
windows(8,4); par(mar=c(3,3,0.2,0.2),mgp=c(1.75,0.5,0),mfrow=c(1,2))
d <- rbind(c(3,0,6,0,2),
           c(7,4,10,4,6),
           c(3.3,3.3,6.3,3.3,3.3))
colnames(d) <- c("A","B","C","D","E")
rownames(d) <- c("X","Y","Z")
plot(1:ncol(d),d[1,],type="o",xlab="Row Factor",ylab="Mean Response",yaxt="n",xaxt="n",ylim=c(-0.2,10.2),xlim=c(0.25,5.25),lwd=2,pch=19)
lines(1:ncol(d),d[2,],type="o",lwd=2,pch=17,lty=2)
lines(1:ncol(d),d[3,],type="o",lwd=2,pch=15,lty=3)
axis(1,1:ncol(d),colnames(d))
legend("topleft",rownames(d),pch=c(19,17,15),lty=1:3,bty="n")

plot(1:nrow(d),d[,1],type="o",xlab="Column Factor",ylab="Mean Response",yaxt="n",xaxt="n",ylim=c(-0.2,10.2),xlim=c(0.5,3.25),lwd=2,pch=19)
lines(1:nrow(d),d[,2],type="o",lwd=2,pch=17,lty=2)
lines(1:nrow(d),d[,3],type="o",lwd=2,pch=15,lty=3)
lines(1:nrow(d),d[,4],type="o",lwd=2,pch=3,lty=4)
lines(1:nrow(d),d[,5],type="o",lwd=2,pch=4,lty=5)
axis(1,1:nrow(d),rownames(d))
legend("topleft",colnames(d),pch=c(19,17,15,3,4),lty=1:5,bty="n")
