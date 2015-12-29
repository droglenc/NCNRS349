# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","captioner","knitr")
library(FSA)
# setup figure, table, and equation captioning
library(captioner)

figcaps <- captioner(prefix="Figure")
figcaps("CatchCurveModel","Ideal plots of catch versus age (Left) and the natural log of catch versus age (Right) for a single cohort of fish.  The right graph is called a longitudinal catch curve.  The change in $log(C_{t})$ for a unit change in $t$ is emphasized on the catch curve to reinforce the idea that the slope of the idealized catch curve is $Z$.")
figcaps("CatchCurveIdeal","Idealized catch curve (plot of the natural log of catch versus age) illustrating the ascending, domed, and descending portions.  The red dotted line represents the idealized catch curve if all age-classes were fully recruited to the fishery.")
figcaps("CatchCurveAssumptions","Simulated catch curves to illustrate shapes when assumptions are violated.  Each simulation (i.e., plot), unless otherwise, noted uses $N_{0}=1000$ for each year-class, $Z=0.40$, and incomplete recruitment until age-4 and then constant recruitment for subsequent ages.  In simulation I, a coefficient of variation for $N_{0}$ of 0.3 was used.  In simulation II, constant multipliers of change in recruitment of 0.4, 0.7, 1.3, and 1.6 were applied at age-6.  In simulation III, geometric multipliers of $Z$ by age of 0.8, 0.9, 1.1, and 1.2 were applied at age-6.  In simulation IV, the vulnerability of age-10 and older fish was cut in half (in run 1) and decreased by 0.1 for each age (in run 2).  In each plot, the catch curve with no assumption violations is shown as a solid black line.  In simulation I, the average of the three runs is shown as a solid blue line.")

tblcaps <- captioner(prefix="Table")
tblcaps("CatchCurveCross","The hypothetical catch of fish by age and capture year.  The longitudinal catch of the 2002 and the partial 2006 year-classes of fish are shown by the two sets of diagonal cells highlighted in dark grey.  The cross-sectional catch in the 2009 capture year is shown by the column of cells highlighted in light grey.  All data were modeled with Equation 2 assuming that $N_{0}=500$, $Z=-log(0.7)$, and $v=0.1$.")
tblcaps("BrkTrtDataCR","Cross-sectional total catch-at-age of Tobin Harbor Brook Trout in fyke nets, 1996-1998, modified to illustrate the calculations of the Chapman-Robson method.")

eqncaps <- captioner(prefix="Equation")
eqncaps("ModExpModel")
eqncaps("CatchCurveExpModel")
eqncaps("CatchCurveModel")
eqncaps("CatchCurveExpModel2")
eqncaps("CatchCurveModel2")
eqncaps("ChapmanRobsonS")
eqncaps("ChapmanRobsonSSE1")
eqncaps("ChapmanRobsonSSE2")
eqncaps("ChapmanRobsonZSE")
eqncaps("ChapmanRobsonZ2")
eqncaps("ChapmanRobsonZSE2")
eqncaps("")
# ===== END -- THIS CAN BE IGNORED ===========================

No <- 500
S <- 0.7
z <- -log(S)
v <- 0.1
sd.v <- 0.005
t <- 0:10
Nt.d <- No*exp(-z*t)              #deterministic population
Ct.d <- v*Nt.d                    #deterministic catch
set.seed(20)
v.s <- rnorm(length(t),v,sd.v)
Ct.s <- v.s*Nt.d

plot(t,Ct.d,type="l",xlab="Age / Time",ylab="Catch",lwd=3)
lnCt.d <- log(Ct.d)
plot(t,lnCt.d,type="l",xlab="Age / Time",ylab="log(Catch)",lwd=3)
lines(c(2,2,3),c(lnCt.d[3],lnCt.d[3]-z,lnCt.d[4]),col="red",lty=3,lwd=2)
text(1.5,lnCt.d[3]-z/2,"-Z",col="red"); text(2.5,lnCt.d[4]-z/2,"1",col="red")
lines(c(6,6,7),c(lnCt.d[7],lnCt.d[7]-z,lnCt.d[8]),col="red",lty=3,lwd=2)
text(5.5,lnCt.d[7]-z/2,"-Z",col="red"); text(6.5,lnCt.d[8]-z/2,"1",col="red")

q <- c(0.1,0.35,0.75,0.9,0.95,1,1,1,1,1,1)
Ct.d.q <- q*Ct.d
lnCt.d.q <- log(Ct.d.q)
plot(t,lnCt.d,type="l",xlab="Age / Time",ylab="log(Catch)",lwd=3,lty=3,col="red")
lines(t,lnCt.d.q,lwd=3)
abline(v=1.5,lty=3)
abline(v=3.5,lty=3)
text(0.75,0.5,"Asc")
text(2.5,0.5,"Dome")
text(6,0.5,"Descending")
lines(c(5,5,6),c(lnCt.d[6],lnCt.d[6]-z,lnCt.d[7]),col="red",lty=3,lwd=2)
text(4.5,lnCt.d[6]-z/2,"-Z",col="red")
text(5.5,lnCt.d[7]-z/2,"1",col="red")
lines(c(8,8,9),c(lnCt.d[9],lnCt.d[9]-z,lnCt.d[10]),col="red",lty=3,lwd=2)
text(7.5,lnCt.d[9]-z/2,"-Z",col="red")
text(8.5,lnCt.d[10]-z/2,"1",col="red")

par(mfrow=c(2,2))
#--------------------------------------------------------------
cc.sim.book <- function(Ages,Z.param,No.param,v) {
  # Creates vector of initial year-class sizes for each year-class (obviously)
  make.No.ycl <- function(Ages,param) {
    #   Initiate No vector with randomly select values from a Normal Distribution
    No <- rnorm(length(Ages),param$mean,param$mean*param$cv)
    #   Initiate the multiplication vector with 1s
    md <- rep(1,length(Ages))
    #   If a delta value is sent then must change the multiplication vector
    if (param$delta!=1) {
      #   If a steady change, ...
      if (param$dstdy) {
        #   ... replace 1s with delta value
        md[param$dage:length(Ages)] <- param$delta
      } else {
        #   If a non-steady change, ...
        for (i in (param$dage:length(Ages))) {
          #   ... replace 1s with delta raised to power of number of ages past t1
          md[i] <- param$delta^(i-param$dage+1)
        }
      }
    }
    #   Adjust initial No values by the multiplier vector
    No*md
  }

  # Creates vector of initial Zs for each year-class (concept is same as make.No)
  make.Z.ycl <- function(Ages,param) {
    #   Initiate Z vector with randomly select values from a Normal Distribution
    Z <- rnorm(length(Ages),param$mean,param$mean*param$cv)
    #   Initiate the multiplication vector with 1s
    md <- rep(1,length(Ages))
    if (param$delta!=1) {
      #   If a delta value is sent then must change the multiplication vector
      if (param$dstdy) {                                      
        #   If a steady change, replace 1s with delta value
        md[param$dage:length(Ages)] <- param$delta
      } else {
        #   If a non-steady change, ...
        for (i in (param$dage:length(Ages))) {
          #   ... replace 1s with delta raised to power of number of ages past t1
          md[i] <- param$delta^(i-param$dage+1)  
        }
      }
    }
    #   Adjust initial Z values by the multiplier vector
    Z*md
  }

  make.Z.age <- function(Ages,param) {
    #   Initiate ages vector with the list of ages
    Ages.adj <- Ages
    #   If a delta value is sent then must change the multiplication vector
    if (param$delta!=1) {
      if (param$dstdy) {
        for (i in (param$dage:length(Ages))) {
          Ages.adj[i] <- (1-param$delta)*Ages.adj[param$dage]+param$delta*Ages.adj[i]
        }
      } else {
        for (i in (param$dage:length(Ages))) {
          Ages.adj[i] <- Ages.adj[i-1]+param$delta^(i-param$dage)
        }
      }
    }
    return(Ages.adj)
  }

  # Vector of initial year-class sizes
  No <- make.No.ycl(Ages,No.param)
  # If Z will vary by year-class ...
  if (Z.param$YCL) {
    #   Vector of Zs for each year-class
    Z <- make.Z.ycl(Ages,Z.param)
    #   Population sizes for each age
    N <- No*exp(-Z*Ages)
  } else {
    # or if Z varies by age (irrespective of year-class)
    #   Create Z vector with randomly select values from a Normal Distribution
    Z <- rnorm(length(Ages),Z.param$mean,Z.param$mean*Z.param$cv)
    #   Adjust age vector for handling change in Zs by age
    Ages.adj <- make.Z.age(Ages,Z.param)
    #   Population sizes for each age
    N <- No*exp(-Z*Ages.adj)
  }
  # Calculate catch from population size and vulnerabilities
  C <- v*N
#  return(list(Z,No,N,C))
  return(C)
}

Ages <- 1:15
#------------------------------------------------------------------------------
# CC #1 -- Variable recruitment (with average curve overlaid) -- BUMPINESS
set.seed(100)
v <- c(0.1,0.3,0.6,rep(1,12))
Z.param <- list(mean=0.40,cv=0,delta=1,dage=6,dstdy=FALSE,YCL=FALSE)
No.param <- list(mean=1000,cv=0.30,delta=1,dage=6,dstdy=FALSE)
cc.1 <- matrix(0,length(Ages),3)
for (j in 1:3) {
  cc.1[,j] <- cc.sim.book(Ages,Z.param,No.param,v)
}
matplot(Ages,log(cc.1),type="b",cex=0.75,lwd=1,lty=1,ylab="log(Catch)",ylim=c(0,max(log(cc.1))))
cc.1avg <- (cc.1[,1]+cc.1[,2]+cc.1[,3])/3
lines(Ages,log(cc.1avg),lwd=3,col="blue")
text(max(Ages)-1,max(log(cc.1))-0.5,"I",cex=1.5)

#------------------------------------------------------------------------------
# CC #2 --  Constant change in recruitment -- OFFSET
Z.param <- list(mean=0.40,cv=0,delta=1,dage=6,dstdy=TRUE,YCL=FALSE)
No.param <- list(mean=1000,cv=0,delta=1,dage=6,dstdy=TRUE)
No.delta <- c(1,0.4,0.7,1.3,1.6)
cc.2 <- matrix(0,length(Ages),length(No.delta))
for (j in 1:length(No.delta)) {
  No.param$delta <- No.delta[j]
  cc.2[,j] <- cc.sim.book(Ages,Z.param,No.param,v)
}
matplot(Ages,log(cc.2),type=c("l",rep("b",4)),cex=0.75,lwd=c(2,rep(1,4)),lty=1,pch=c("","1","2","3","4"),ylab="log(Catch)",ylim=c(0,max(log(cc.2))))
text(max(Ages)-1,max(log(cc.2))-0.5,"II",cex=1.5)

#------------------------------------------------------------------------------
# CC #3 --  Geometric change in z by age -- CONCAVE/CONVEX
Z.param <- list(mean=0.40,cv=0,delta=1,dage=6,dstdy=FALSE,YCL=FALSE)
No.param <- list(mean=1000,cv=0,delta=1,dage=6,dstdy=TRUE)
Z.delta <- c(1,0.8,0.9,1.1,1.2)
cc.3 <- matrix(0,length(Ages),length(Z.delta))
for (j in 1:length(Z.delta)) {
  Z.param$delta <- Z.delta[j]
  cc.3[,j] <- cc.sim.book(Ages,Z.param,No.param,v)
}
matplot(Ages,log(cc.3),type=c("l",rep("b",4)),cex=0.75,lwd=c(2,rep(1,4)),lty=1,pch=c("","1","2","3","4"),ylab="log(Catch)",ylim=c(0,max(log(cc.3))))
text(max(Ages)-1,max(log(cc.3))-0.5,"III",cex=1.5)

#------------------------------------------------------------------------------
# CC #4 --  Geometric change in z by age -- CONCAVE/CONVEX
v <- matrix(1,15,3)
v[,1] <- c(0.1,0.3,0.6,rep(0.8,12))
v[,2] <- c(0.1,0.3,0.6,rep(0.8,6),0.4,0.4,0.4,0.4,0.4,0.4)
v[,3] <- c(0.1,0.3,0.6,rep(0.8,6),0.7,0.6,0.5,0.4,0.3,0.2)

Z.param <- list(mean=0.40,cv=0,delta=1,dage=6,dstdy=FALSE,YCL=FALSE)
No.param <- list(mean=1000,cv=0,delta=1,dage=6,dstdy=TRUE)
cc.4 <- matrix(0,length(Ages),3)
for (j in 1:3) {
  cc.4[,j] <- cc.sim.book(Ages,Z.param,No.param,v[,j])
}
matplot(Ages,log(cc.4),type=c("l",rep("b",2)),cex=0.75,lwd=c(2,rep(1,2)),lty=1,pch=c("","1","2","3","4"),ylab="log(Catch)",ylim=c(0,max(log(cc.4))))
text(max(Ages)-1,max(log(cc.4))-0.5,"IV",cex=1.5)


# Script created at 2015-12-29 12:26:33
