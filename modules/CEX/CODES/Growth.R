## Required packages
library(FSA)
library(tidyverse)
library(ggplot2)
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
( vbTyp <- vbFuns("Typical") )
( svTyp <- vbStarts(fl~age,data=epf,type="Typical") )
fitTyp <- nls(fl~vbTyp(age,Linf,K,t0),data=epf,start=svTyp)
bootTyp <- nlsBoot(fitTyp)
cbind(Est=coef(fitTyp),confint(bootTyp))

## Predicted mean length-at-age (age-4 in this example)
p4Typ <- apply(bootTyp$coefboot,MARGIN=1,FUN=vbTyp,t=4)
c(Est=vbTyp(4,coef(fitTyp)),quantile(p4Typ,c(0.025,0.975)))

## Demonstrate half-life principal
log(2)/coef(fitTyp)[["K"]]

## Model fit
x <- seq(0,8,length.out=199)
pfl <- vbTyp(x,coef(fitTyp))
dp <- data.frame(age=x,fl=pfl)
ggplot() +
  geom_point(data=epf,mapping=aes(x=age,y=fl),color=col2rgbt("black",1/2)) +
  geom_line(data=dp,mapping=aes(x=age,y=fl),color="blue",size=1) +
  scale_x_continuous(name="Otolith Age (years)") +
  scale_y_continuous(name="Fork Length (cm)") +
  theme_bw()



## Fit Mooij version
( vbMoo <- vbFuns("Mooij") )
( svMoo <- vbStarts(fl~age,data=epf,type="Mooij") )
fitMoo <- nls(fl~vbMoo(age,Linf,L0,omega),data=epf,start=svMoo)
bootMoo <- nlsBoot(fitMoo)
cbind(Est=coef(fitMoo),confint(bootMoo))
p4Moo <- apply(bootMoo$coefboot,MARGIN=1,FUN=vbMoo,t=4)
c(Est=vbMoo(4,coef(fitMoo)),quantile(p4Moo,c(0.025,0.975)))
