library(FSA)
t <- 0:52
xlmt <- range(t)
Z <- rep(1,length(t))
ylmt <- c(0,1.1*max(Z))
clrs1 <- c("black","blue","red")
clrs2 <- col2rgbt(clrs1,1/2)
ylbl <- "Instantaneous Mortality Rate"
xlbl <- "Time"
lgnd <- c("Z","F","M")
par(mar=c(2,2,2,0.5),mgp=c(1,0,0),xaxt="n",yaxt="n")

## Type I
mn <- "Discrete (Type I) Fishery"
F <- c(1,1,.9,.8,.5,.2,.1,rep(0,46))
M <- c(0,0,.1,.2,.5,.8,.9,rep(1,46))
plot(NA,xlab=xlbl,ylab=ylbl,xlim=xlmt,ylim=ylmt,main=mn)
lines(t,Z,lwd=3,col=clrs[1])
lines(t,F,lwd=3,col=clrs[2])
lines(t,M,lwd=3,col=clrs[3])
legend("right",lgnd,col=clrs1,lwd=3,bty="n")

## Type II
mn <- "Continuous (Type II) Fishery"
F <- rep(0.6,length(t))
M <- rep(0.4,length(t))
plot(NA,xlab=xlbl,ylab=ylbl,xlim=xlmt,ylim=ylmt,main=mn)
lines(t,Z,lwd=3,col=clrs[1])
lines(t,F,lwd=3,col=clrs[2])
lines(t,M,lwd=3,col=clrs[3])
text(40,c(1,0.6,0.4)+0.05,lgnd,col=clrs1,cex=1.2,)
