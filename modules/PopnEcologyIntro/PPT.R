Nt <- 0:11

## Rate of change for increasing exponential growth
windows(4,4)
par(mar=c(2,2,0.5,0.5),mgp=c(0.5,0,0))
b <- 0.3
d <- 0.2
plot(0,xlab="Population Size",ylab="Per Capita Rate",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(0,0.5))
lines(rep(b,length(Nt))~Nt,col="red",lwd=2)
lines(rep(d,length(Nt))~Nt,col="black",lwd=2)
legend("topright",c("Birth Rate","Death Rate"),col=c("red","black"),lwd=2,bty="n")

## Rate of change for decreasing exponential growth
b <- 0.2
d <- 0.3
plot(0,xlab="Population Size",ylab="Per Capita Rate",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(0,0.5))
lines(rep(b,length(Nt))~Nt,col="red",lwd=2)
lines(rep(d,length(Nt))~Nt,col="black",lwd=2)
legend("topright",c("Birth Rate","Death Rate"),col=c("red","black"),lwd=2,bty="n")

## Schematic for popn size vs time plot
plot(0,xlab="time",ylab="Population Size",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(0,0.5))

## Rate of change graph for density dependent model ..
b <- 0.4
bslope <- (d-b)/length(Nt)
bs <- b+bslope*Nt
d <- 0.2
dslope <- -bslope
ds <- d+dslope*Nt
plot(0,xlab="Population Size",ylab="Per Capita Rate",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(0,0.5))
lines(bs~Nt,col="red",lwd=2)
lines(ds~Nt,col="black",lwd=2)
legend("topright",c("Birth Rate","Death Rate"),col=c("red","black"),lwd=2,bty="n")

## Schematic for population rate of change vs population size plot 
par(mar=c(2,2,0.5,0.5),mgp=c(1,0.2,0),tcl=-0.2)
plot(0,xlab="Population Size",ylab="Per Capita Rate",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(-0.5,0.5))
legend("topright",c("Population Rate of Change"),col=c("blue"),lwd=2,bty="n")
abline(h=0,lwd=2,lty=2)
axis(2,0,0)

## Density-dependent rate of change vs population size plot
K <- Nt[which((bs-ds)==0)]
plot(0,xlab="Population Size",ylab="Per Capita Rate",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(-0.5,0.5))
legend("topright",c("Population Rate of Change"),col=c("blue"),lwd=2,bty="n")
abline(h=0,lwd=2,lty=2)
axis(2,0,0)
abline(v=K,lwd=2,lty=2,col="gray50")
axis(1,K,"K")
lines((bs-ds)~Nt,col="blue",lwd=2)

## Same as above but zoomed in slightly and different labels.
plot(0,xlab="Population Size",ylab="Per Capita Rate (r)",col="white",xaxt="n",yaxt="n",xlim=c(0,8),ylim=c(-0.05,0.25))
abline(h=0,lwd=2,lty=2)
axis(2,0,0)
axis(1,c(0,K),c("0","K"))
lines((bs-ds)~Nt,col="blue",lwd=2)
rmax <- max(bs-ds)
points(c(0,K),c(rmax,0),pch=19)
text(0,rmax,"(0,rmax)",pos=4)
text(K,0,"(K,0)",adj=c(0.1,-0.5))

## Rate of change plot versus density & density versus time for density independence
r <- 0.2
rs <- rep(r,length(Nt))
plot(0,xlab="Population Size",ylab="Per Capita Rate (r)",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(0,0.5))
abline(h=0,lwd=2,lty=2)
axis(2,0,0)
lines(rs~Nt,col="blue",lwd=2)

N <- numeric(length(Nt))
t <- 0:(length(Nt)-1)
N[1] <- 1
N[2:length(Nt)] <- N[1]*(1+r)^(t[2:length(Nt)])
plot(0,xlab="Time",ylab="Population Size",col="white",xaxt="n",yaxt="n",ylim=c(0,max(N)),xlim=range(t))
lines(N~t,col="blue",lwd=2)

## Rate of change plot versus density & density versus time for density independence
r <- 0.2
K <- 5
rs <- r*(1-Nt/K)
plot(0,xlab="Population Size",ylab="Per Capita Rate (r)",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(-0.3,0.3))
abline(h=0,lwd=2,lty=2)
axis(2,0,0)
lines(rs~Nt,col="blue",lwd=2)

t <- 0:25
N <- numeric(length(t))
N[1] <- 1
for (i in 2:length(t)) N[i] <- N[i-1]*(1+r*(1-N[i-1]/K))
plot(0,xlab="Time",ylab="Population Size",col="white",xaxt="n",yaxt="n",ylim=c(0,max(N)),xlim=range(t))
lines(N~t,col="blue",lwd=2)

## Non-linear density-dependence example
rs <- c(rep(0.2,5),0.15,0.10,0.05,0,-0.05,-0.10)
Nt <- 1:length(rs)
plot(0,xlab="Population Size",ylab="Per Capita Rate (r)",col="white",xaxt="n",yaxt="n",xlim=range(Nt),ylim=c(-0.1,0.25))
abline(h=0,lwd=2,lty=2)
axis(2,0,0)
lines(rs~Nt,col="blue",lwd=2)
