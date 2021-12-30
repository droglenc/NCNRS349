# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","captioner","knitr")
library(FSA)
# setup figure, table, and equation captioning
library(captioner)

figcaps <- captioner(prefix="Figure")
figcaps("CatchCurveAssumptions","Simulated catch curves to illustrate shapes when assumptions are violated. Each simulation (i.e., plot), unless otherwise, noted uses $N_{0}=1000$ for each year-class, $Z=0.40$, and incomplete recruitment until age-4 and then constant recruitment for subsequent ages. In simulation I, a coefficient of variation for $N_{0}$ of 0.3 was used. In simulation II, constant multipliers of change in recruitment of 0.4, 0.7, 1.3, and 1.6 were applied at age-6. In simulation III, geometric multipliers of $Z$ by age of 0.8, 0.9, 1.1, and 1.2 were applied at age-6. In simulation IV, the vulnerability of age-10 and older fish was cut in half (in run 1) and decreased by 0.1 for each age (in run 2). In each plot, the catch curve with no assumption violations is shown as a solid black line. In simulation I, the average of the three runs is shown as a solid blue line.")
# ===== END -- THIS CAN BE IGNORED ===========================

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

          links=c(Script="Mortality2.R",RMarkdown="Mortality2.Rmd"))


# Script created at 2021-12-29 20:40:36
