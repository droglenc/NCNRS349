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
figcaps("CatchCurveModel","Ideal plots of catch versus age (Left) and the natural log of catch versus age (Right) for a single cohort of fish. The right graph is called a longitudinal catch curve. The change in $log(C_{t})$ for a unit change in $t$ is emphasized on the catch curve to reinforce the idea that the slope of the idealized catch curve is $Z$.")
figcaps("CatchCurveIdeal","Idealized catch curve (plot of the natural log of catch versus age) illustrating the ascending, domed, and descending portions. The red dotted line represents the idealized catch curve if all age-classes were fully recruited to the fishery.")

tblcaps <- captioner(prefix="Table")
tblcaps("CatchCurveCross","The hypothetical catch of fish by age and capture year. The longitudinal catch of the 2002 and the partial 2006 year-classes of fish are shown by the two sets of diagonal cells highlighted in dark grey. The cross-sectional catch in the 2009 capture year is shown by the column of cells highlighted in light grey. All data were modeled with Equation 2 assuming that $N_{0}=500$, $Z=-log(0.7)$, and $v=0.1$.")

eqncaps <- captioner(prefix="Equation")
eqncaps("ModExpModel")
eqncaps("CatchCurveExpModel")
eqncaps("CatchCurveModel")
eqncaps("CatchCurveExpModel2")
eqncaps("CatchCurveModel2")
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

          links=c(Script="Mortality1.R",RMarkdown="Mortality1.Rmd"))


# Script created at 2021-12-29 20:38:45
