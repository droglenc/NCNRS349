# 
# First line renders an appropriate HTML file for the webpage
# Second line makes the script file
# RUN BOTH MANUALLY (following using Knit HTML button)
setwd("C:/aaaWork/Web/GitHub/NCNRS349/modules/Depletion/")
source("../../rhelpers/Rhelpers.R")
modHTML("BKG",need2render=FALSE)

##############################################################
# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","captioner","knitr")
library(FSA)
# setup figure, table, and equation captioning
library(captioner)

figcaps <- captioner(prefix="Figure")
figcaps("LeslieModelFig","Idealized plot of the decline in the index of abundance with increasing cumulative catch.  Visual representations of the catchability coefficient, $q$, and initial population size, $N_{0}$ are shown.")
figcaps("DeLuryModelFig","Idealized plot of the decline in the natural logarithm of CPE with increasing cumulative effort.  Visual representations of the catchability coefficient, $q$, and model intercept are shown.")

eqncaps <- captioner(prefix="Equation")
eqncaps("LesliePopnModel")
eqncaps("CPEDefn")
eqncaps("LeslieModel1")
eqncaps("LeslieNOSE")
eqncaps("LeslieModel2")
eqncaps("DeLuryPopnFrac")
eqncaps("DeLuryPopnModel")
eqncaps("DeLuryModel1")
eqncaps("DeLuryModel2")
eqncaps("DeLuryModel3")
eqncaps("KPassIteration")
eqncaps("KPassIterationCS")
# ===== END -- THIS CAN BE IGNORED ===========================
##############################################################

##############################################################
# ===== BEGIN -- LESLIE MODEL FIGURE =========================
par(xaxs="i",yaxs="i")
t <- seq(1:10)                                          # number of sampling times
q <- 0.1                                                # catchability coefficient
f <- rnorm(10,1,0.05)                                   # effort per sampling times -- slightly random for now
E <- rep(0,length(t))                                   # cumulative effort
N <- rep(10,length(t))                                  # population size
K <- rep(0,length(t))                                   # cumulative catch
C <- rep(q*f[1]*N[1],length(t))                         # catch in the time period
K1 <- rep(C[1]/2,length(t))                             # modified cumulative catch

for (i in 2:length(t)) {                                # fill the vectors
  N[i] <- N[i-1] - C[i-1]                               # population declines by catch
  K[i] <- K[i-1] + C[i-1]                               # cum catch increases by catch
  E[i] <- E[i-1] + f[i-1]                               # cum effort increases by effort
  C[i] <- q*f[i]*N[i]                                   # catch for period i
  K1[i] <- K[i] + C[i]/2                                # modified cum catch increaase by half of current catch
  df <- data.frame(N=N,C=C,f=f,CPE=C/f,K=K,K1=K1,E=E)   # make a conglomerative data.frame
}
rm(N); rm(C); rm(f); rm(K); rm(K1); rm(E); rm(t); rm(q)
lm.leslie1 <- lm(CPE~K,data=df)  # Traditional Method
q <- -coef(lm.leslie1)[2]
qN0 <- coef(lm.leslie1)[1]
N0 <- qN0/q
# Raw plot
plot(CPE~K,data=df,ylim=c(0,1.1*max(df$CPE)),xlim=c(0,1.1*N0),ylab="CPE",
     xlab=expression(Cumulative~~Catch~~(K[t-1])),pch=16,cex=1.2,xaxt="n",yaxt="n",xpd=TRUE)
# Add axis labels
axis(2,c(0,max(df$CPE)),c(0,expression(qN[0])),col.axis="red")
axis(1,c(0,N0),c(0,expression(N[0])),col.axis="red")
# Add fitted line
abline(lm.leslie1,lwd=2,col="gray50")
# Add demo of q
p <- predict(lm.leslie1,data.frame(K=c(3,4)))
lines(c(3,4,4),c(p[1],p[1],p[2]),lwd=2,col="red")
text(3.5,p[1],"1",col="red",pos=3)
text(4,p[1]+(p[2]-p[1])/2,"q",col="red",pos=4)
# ===== END -- LESLIE MODEL FIGURE ===========================
##############################################################

##############################################################
# ===== BEGIN -- DELURY MODEL FIGURE =========================
par(mar=c(3.05,3.55,0.65,0.15),xaxs="i",yaxs="i")
lm.delury1 <- lm(log(CPE)~E,data=df)
q <- -coef(lm.delury1)[2]
qN0 <- exp(coef(lm.delury1)[1])
N0 <- qN0/q
plot(log(CPE)~E,data=df,ylab="log(CPE)",xlab=expression(Cumulative~~Effort~~(E[t-1])),
     ylim=c(min(log(CPE)),0.05),pch=16,cex=1.2,xaxt="n",yaxt="n",xpd=TRUE)
# Add axis labels
axis(2,max(log(df$CPE)),expression(log(qN[0])),col.axis="red")
axis(1,0,col.axis="red")
# Add fitted line
abline(lm.delury1,lwd=2,col="gray50")
# Add demo of q
p <- predict(lm.delury1,data.frame(E=c(3,4)))
lines(c(3,4,4),c(p[1],p[1],p[2]),lwd=2,col="red")
text(3.5,p[1],"1",col="red",pos=3)
text(4,p[1]+(p[2]-p[1])/2,"q",col="red",pos=4)
# ===== END -- DELURY MODEL FIGURE ===========================
##############################################################


# Script created at 2017-01-06 12:58:52
