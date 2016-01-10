# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","FSAdata","captioner","knitr","xtable")
library(FSA)
library(FSAdata)
# for upperTriangle
library(gdata)
# to make tables
library(xtable)
# setup figure, table, and equation captioning
library(captioner)

figcaps <- captioner(prefix="Figure")
figcaps("GrowthDataEx","Length-at-age of male Atlantic Croaker.  Red lines are the average length-at-age.")
figcaps("VBModelTypicalEx","Example of the typical parameterization of the VBGF fit to size-at-age Atlantic Croaker data.  The plot on the left is the fitted model expressed over the observed ages and lengths of the data.  The plot on the right is the same fitted model but expressed over a range of ages and lengths that allow illustrating the meaning of $L_{\\infty}$ and $t_{0}$.")
figcaps("VBModelOriginalEx",'Example of the "original" parameterization of the VBGF fit to size-at-age Atlantic Croaker data.  The plot on the left is the fitted model expressed over the observed ages and lengths of the data.  The plot on the right is the same fitted model but expressed over a range of ages and lengths that allows for illustrating the meaning of $L_{\\infty}$ and $L_{0}$.')
figcaps("VBModelSchnuteEx","Example of the Schnute parameterization of the VBGF fit to size-at-age Atlantic Croaker data expressed over a range of ages and lengths that allow illustrating the meaning of $L_{1}$ and $L_{2}$.  In addition, the blue lines correspond to $L_{\\infty}$ from Figure 2 and $L_{0}$ from Figure 3 for comparative purposes.")
figcaps("VBModelFrancisEx","Example of the Francis parameterization of the VBGF fit to size-at-age Atlantic Croaker data expressed over a range of ages and lengths that allow illustrating the meaning of $L_{1}$, $L_{2}$, and $L_{3}$.  Note that the arbitrary ages chosen were $t_{1}$=2 and $t_{3}$=9.")
figcaps("VBModelParamComp","Fits of the typical (blue), Schnute (red), and Francis (green) parameterizations of the VBGF to size-at-age Atlantic Croaker data (auto-generated starting values were used for all parameterizations).  Note that the results of all fits are identical and, thus, the fitted lines are directly on top of each other.  Different colors and different line widths were used to illustrate this point but may not be readily apparent on the screen or printed page.")

tblcaps <- captioner(prefix="Table")
tblcaps("GrowthDataEx","Length-at-age for a portion of a sample of male Atlantic Croakers (left) and average length-at-age (right) for all male Atlantic Croakers in 1999.")
tblcaps("VBModelParamComp",'Parameter estimates and model results from fitting different parameterizations of the VBGF to the male Atlantic Croaker data.  Note that $L_{1}$, $L_{2}$, and $L_{3}$ are not comparable between parmaterizations; $L_{1}$, $L_{2}$, and $L_{3}$ correspond to ages 2, 5.5, and 9 in the Francis parameterization; "iters" is the number of iterations to convergence; and $r_{max}$ and $r_{mean}$ are the maximum and average absolute value of correlation coefficients among the three parameters.')

eqncaps <- captioner(prefix="Equation")
eqncaps("VBModelTypicalLength")
eqncaps("VBKdefn")
eqncaps("VBModelOriginalLength")
eqncaps("VBModelGallucciQuinnLength")
eqncaps("VBModelMooijLength")
eqncaps("VBModelSchnuteLength")
eqncaps("VBModelFrancisLength")
# ===== END -- THIS CAN BE IGNORED ===========================

data(Croaker2)
crm <- Subset(Croaker2,sex=="M")

plot(tl~age,data=crm,ylab="Total Length (mm)",pch=19)
sumdata <- aggregate(cbind(crm$tl,crm$age),list(crm$age),mean)
names(sumdata) <- c("age","mean.tl","age1")
points(mean.tl~age,data=sumdata,pch=151,cex=1.25,col="red")

vb1 <- vbFuns()
fit1 <- nls(tl~vb1(age,Linf,K,t0),data=crm,
            start=vbStarts(tl~age,data=crm,type="typical"))
Linf <- coef(fit1)[1]
t0 <- coef(fit1)[3]
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",pch=19)
curve(vb1(x,Linf=Linf,K=coef(fit1)[2],t0=t0),from=1,to=10,lwd=3,add=TRUE)
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",ylim=c(0,470),xlim=c(-2,12),pch=19,xaxt="n")
axis(1,seq(0,12,2))
curve(vb1(x,Linf=Linf,K=coef(fit1)[2],t0=t0),from=-2,to=12,lwd=3,add=TRUE)
# Mark t0 on plot
lines(c(t0,t0),c(-20,20),lwd=2,lty=3,col="red")
lines(c(-4,-1),c(0,0),lwd=2,lty=3,col="red")
points(t0,0,col="red",pch=19,cex=1.25)
text(t0,-42,expression(t[0]),xpd=TRUE,col="red",cex=1.25)
# Mark Linf on plot
abline(h=Linf,lwd=2,lty=3,col="red")
text(-3.6,Linf,expression(L[infinity]),xpd=TRUE,col="red",cex=1.25)

# original parameterization
vb2 <- vbFuns("original")
fit2 <- nls(tl~vb2(age,Linf,L0,K),data=crm,
            start=vbStarts(tl~age,data=crm,type="original"))
Linf <- coef(fit2)[1]
L0 <- coef(fit2)[2]
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",pch=19)
curve(vb2(x,Linf=Linf,L0=L0,K=coef(fit2)[3]),from=1,to=10,lwd=3,add=TRUE)
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",ylim=c(0,470),xlim=c(-2,12),pch=19)
curve(vb2(x,Linf=Linf,L0=L0,K=coef(fit2)[3]),from=-2,to=12,lwd=3,add=TRUE)
# Mark L0 on plot
lines(c(0,0),c(-50,L0),lwd=2,lty=3,col="red")
lines(c(-4,-0),c(L0,L0),lwd=2,lty=3,col="red")
points(0,L0,col="red",pch=19,cex=1.25)
text(-3.6,L0,expression(L[0]),xpd=TRUE,col="red",cex=1.25)
# Mark Linf on plot
abline(h=Linf,lwd=2,lty=3,col="red")
text(-3.6,Linf,expression(L[infinity]),xpd=TRUE,col="red",cex=1.25)

vb3 <- vbFuns("Schnute")
min.age <- min(crm$age)
max.age <- max(crm$age)
fit3 <- nls(tl~vb3(age,L1,L3,K,t1=min.age,t3=max.age),data=crm,
            start=vbStarts(tl~age,data=crm,type="Schnute"))
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",ylim=c(0,470),xlim=c(-2,12),pch=19,xaxt="n",yaxt="n")
axis(1,seq(-2,12,2),FALSE)
axis(1,c(2,4,6,8,12))
axis(2,seq(0,500,100),FALSE)
axis(2,c(0,100,300))
L1 <-coef(fit3)[1]
L3 <-coef(fit3)[2]
curve(vb3(x,L1=L1,L3=L3,K=coef(fit3)[3],t1=min.age,t3=max.age),
      from=-2,to=12,lwd=3,add=TRUE)
# Mark Linf on plot
abline(h=Linf,lwd=2,lty=3,col="blue")
# Mark L0 on plot
lines(c(0,0),c(-50,L0),lwd=2,lty=3,col="blue")
lines(c(-4,-0),c(L0,L0),lwd=2,lty=3,col="blue")
# Mark L1 on plot
lines(c(-4,min.age+1),c(L1,L1),lwd=2,lty=3,col="red")
lines(c(min.age,min.age),c(-20,L1+20),lwd=2,lty=3,col="red")
points(min.age,L1,col="red",pch=19,cex=1.25)
text(min.age,-37,expression(t[1]),xpd=TRUE,col="red",cex=1.25)
text(-3.6,L1,expression(L[1]),xpd=TRUE,col="red",cex=1.25)
# Mark L3 on plot
lines(c(max.age,max.age),c(-20,L3+20),lwd=2,lty=3,col="red")
lines(c(-4,max.age+1),c(L3,L3),lwd=2,lty=3,col="red")
points(max.age,L3,col="red",pch=19,cex=1.25)
text(max.age,-37,expression(t[3]),xpd=TRUE,col="red",cex=1.25)
text(-3.6,L3,expression(L[3]),xpd=TRUE,col="red",cex=1.25)

vb4 <- vbFuns("Francis")
t1 <- 2
t3 <- 9
t2 <- (t1+t3)/2
fit4 <- nls(tl~vb4(age,L1,L2,L3,t1=t1,t3=t3),data=crm,
            start=vbStarts(tl~age,data=crm,type="Francis",ages2use=c(t1,t3)))
# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",ylim=c(0,470),xlim=c(-2,12),pch=19,xaxt="n",yaxt="n")
axis(1,c(t1,t2,t3),FALSE)
axis(2,seq(0,500,100))
L1 <-coef(fit4)[1]
L2 <-coef(fit4)[2]
L3 <-coef(fit4)[3]
curve(vb4(x,L1=L1,L2=L2,L3=L3,t1=t1,t3=t3),from=-2,to=12,lwd=3,add=TRUE)
# Mark L1 on plot
lines(c(t1,t1),c(-20,L1+20),lwd=2,lty=3,col="red")
lines(c(-4,t1+1),c(L1,L1),lwd=2,lty=3,col="red")
points(t1,L1,col="red",pch=19,cex=1.25)
text(t1,-45,expression(t[1]),xpd=TRUE,col="red",cex=1.25)
text(-3.6,L1,expression(L[1]),xpd=TRUE,col="red",cex=1.25)
# Mark L2 on plot
lines(c(t2,t2),c(-20,L2+20),lwd=2,lty=3,col="red")
lines(c(-4,t2+1),c(L2,L2),lwd=2,lty=3,col="red")
points(t2,L2,col="red",pch=19,cex=1.25)
text(t2,-45,expression(t[2]),xpd=TRUE,col="red",cex=1.25)
text(-3.6,L2,expression(L[2]),xpd=TRUE,col="red",cex=1.25)
# Mark L3 on plot
lines(c(t3,t3),c(-20,L3+20),lwd=2,lty=3,col="red")
lines(c(-4,t3+1),c(L3,L3),lwd=2,lty=3,col="red")
points(t3,L3,col="red",pch=19,cex=1.25)
text(t3,-45,expression(t[3]),xpd=TRUE,col="red",cex=1.25)
text(-3.6,L3,expression(L[3]),xpd=TRUE,col="red",cex=1.25)

vb5 <- vbFuns("GallucciQuinn")
fit5 <- nls(tl~vb5(age,omega,K,t0),data=crm,
            start=vbStarts(tl~age,data=crm,type="GallucciQuinn")) 
vb6 <- vbFuns("Mooij")
fit6 <- nls(tl~vb6(age,Linf,L0,omega),data=crm,
            start=vbStarts(tl~age,data=crm,type="Mooij")) 
sum1 <- summary(fit1,correlation=TRUE)
coef1 <- coef(fit1)
sum2 <- summary(fit2,correlation=TRUE)
coef2 <- coef(fit2)
sum3 <- summary(fit3,correlation=TRUE)
coef3 <- coef(fit3)
sum4 <- summary(fit4,correlation=TRUE)
coef4 <- coef(fit4)
sum5 <- summary(fit5,correlation=TRUE)
coef5 <- coef(fit5)
sum6 <- summary(fit6,correlation=TRUE)
coef6 <- coef(fit6)
mdls   <- c("Typical","Original","Schnute","Francis","Gallucci Quinn","Mooij")
sL0    <- c(NA,coef2[2],NA,NA,NA,coef6[2])
sLinf  <- c(coef1[1],coef2[1],NA,NA,NA,coef6[1])
sK     <- c(coef1[2],coef2[3],coef3[3],NA,coef5[2],NA)
st0    <- c(coef1[3],NA,NA,NA,coef5[3],NA)
somega <- c(NA,NA,NA,NA,coef5[1],coef6[3])
sL1    <- c(NA,NA,coef3[1],coef4[1],NA,NA)
sL2    <- c(NA,NA,NA,coef4[2],NA,NA)
sL3    <- c(NA,NA,coef3[2],coef4[3],NA,NA)

RSS <- c(sum(residuals(fit1)^2),sum(residuals(fit2)^2),sum(residuals(fit3)^2),sum(residuals(fit4)^2),sum(residuals(fit5)^2),sum(residuals(fit6)^2))
SE <- c(sum1$sigma,sum2$sigma,sum3$sigma,sum4$sigma,sum5$sigma,sum6$sigma)
its <- c(sum1$convInfo$finIter,sum2$convInfo$finIter,sum3$convInfo$finIter,sum4$convInfo$finIter,sum5$convInfo$finIter,sum6$convInfo$finIter)
r.max <- c(max(abs(upperTriangle(sum1$correlation))),max(abs(upperTriangle(sum2$correlation))),max(abs(upperTriangle(sum3$correlation))),max(abs(upperTriangle(sum4$correlation))),max(abs(upperTriangle(sum5$correlation))),max(abs(upperTriangle(sum6$correlation))))
r.mean <- c(mean(abs(upperTriangle(sum1$correlation))),mean(abs(upperTriangle(sum2$correlation))),mean(abs(upperTriangle(sum3$correlation))),mean(abs(upperTriangle(sum4$correlation))),mean(abs(upperTriangle(sum5$correlation))),mean(abs(upperTriangle(sum6$correlation))))

d <- data.frame(mdls,sL0,sLinf,sK,st0,somega,sL1,sL2,sL3,SE,its,r.max,r.mean)
# reorder models to be the same as presented
d <- d[c(1,2,5,6,3,4),]

names(d) <- c("Models","$L_{0}$","$L_{\\infty}$","$K$","$t_{0}$","$\\omega$","$L_{1}$","$L_{2}$","$L_{3}$","SE","iters","$r_{max}$","$r_{mean}$")
xtbl.d <- xtable(d,digits=c(NA,NA,0,0,2,2,1,0,0,0,0,0,2,2),align="llrrrrrrrrrrrr")
print(xtbl.d,include.rownames=FALSE,NA.string="-",
      sanitize.colnames.function=function(x){x})

# Plot the data
plot(tl~jitter(age),data=crm,xlab="Age",ylab="Total Length (mm)",
     ylim=c(100,470),xlim=c(0,10),pch=19)
curve(vb1(x,Linf=coef(fit1)[1],K=coef(fit1)[2],t0=coef(fit1)[3]),
      from=0,to=10,lwd=12,col="blue",add=TRUE)
curve(vb3(x,L1=coef(fit3)[1],L3=coef(fit3)[2],K=coef(fit3)[3],t1=min.age,t3=max.age),
      from=0,to=10,lwd=7,col="red",add=TRUE)
curve(vb4(x,L1=coef(fit4)[1],L2=coef(fit4)[2],L3=coef(fit4)[3],t1=t1,t3=t3),
      from=0,to=10,lwd=2,col="green",add=TRUE)


# Script created at 2016-01-10 12:39:39
