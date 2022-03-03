## Required packages
library(FSA)
library(tidyverse)
library(nlstools)

## Get data, reduce to just females
ep <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/EuroPerchTJ.csv")
str(ep)
epf <- filter(ep,sex=="female")

## Initial look at data (check for curvature, asymptote, young ages)
ggplot(data=epf,mapping=aes(x=age,y=fl)) +
  geom_point() +
  theme_bw()

## Fit the TYPICAL model, get parameter estimates (with CIs)
vbTyp <- vbFuns("Typical",msg=TRUE)
svTyp <- vbStarts(fl~age,data=epf,type="Typical",plot=TRUE)
fitTyp <- nls(fl~vbTyp(age,Linf,K,t0),data=epf,start=svTyp)
bootTyp <- nlsBoot(fitTyp)
cbind(Est=coef(fitTyp),confint(bootTyp))

## Predicted mean length-at-age (age-4 in this example)
p4Typ <- apply(bootTyp$coefboot,MARGIN=1,FUN=vbTyp,t=4)
c(Est=vbTyp(4,coef(fitTyp)),quantile(p4Typ,c(0.025,0.975)))

## Demonstrate half-life principal
log(2)/coef(fitTyp)[["K"]]

## Model fit
ggplot(data=epf,mapping=aes(x=age,y=fl)) +
  geom_point(color=col2rgbt("black",1/3)) +
  stat_function(fun=vbTyp,args=list(Linf=coef(fitTyp)),color="red",size=1) +
  scale_x_continuous(name="Otolith Age (years)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.02))) +
  scale_y_continuous(name="Fork Length (cm)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.02))) +
  theme_bw()



## Fit Mooij version
vbMoo <- vbFuns("Mooij",msg=TRUE)
svMoo <- vbStarts(fl~age,data=epf,type="Mooij",plot=TRUE)
fitMoo <- nls(fl~vbMoo(age,Linf,L0,omega),data=epf,start=svMoo)
bootMoo <- nlsBoot(fitMoo)
cbind(Est=coef(fitMoo),confint(bootMoo))
p4Moo <- apply(bootMoo$coefboot,MARGIN=1,FUN=vbMoo,t=4)
c(Est=vbMoo(4,coef(fitMoo)),quantile(p4Moo,c(0.025,0.975)))

## Model fit
ggplot(data=epf,mapping=aes(x=age,y=fl)) +
  geom_point(color=col2rgbt("black",1/3)) +
  stat_function(fun=vbTyp,args=list(Linf=coef(fitTyp)),color="red",size=1.5) +
  stat_function(fun=vbMoo,args=list(Linf=coef(fitMoo)),color="blue",size=1) +
  scale_x_continuous(name="Otolith Age (years)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.02))) +
  scale_y_continuous(name="Fork Length (cm)",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.02))) +
  theme_bw()
