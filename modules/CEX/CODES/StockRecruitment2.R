library(FSA)
library(tidyverse)
library(ggplot2)

## Get the data, reduct to Nimrod
d <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/CrappieARMS.csv")
str(d)
nim <- filter(d,reservoir=="Nimrod")
str(nim)

## What does the relationship look like?
ggplot(data=nim,mapping=aes(x=stock,y=recruits)) +
  geom_point() +
  scale_x_continuous(name="Number of age-1+ Crappie per hectare") +
  scale_y_continuous(name="Number of age-0+ Crappie per hectare") +
  theme_bw()

## Fit the Ricker S-R model
### Get starting values
rsv <- srStarts(recruits~stock,data=nim,type="Ricker",plot=TRUE)
### Create the Ricker function
rsr <- srFuns("Ricker",msg=TRUE)
### Fit the model
rfit <- nls(log(recruits)~log(rsr(stock,a,b)),data=nim,start=rsv)
summary(rfit)
cbind(Est=coef(rfit),confint(rfit))

## Fit the Independence S-R model
isv <- srStarts(recruits~stock,data=nim,type="independence")
isr <- srFuns("independence")
ifit <- nls(log(recruits)~log(isr(stock,a)),data=nim,start=isv)

## Compare models
extraSS(ifit,com=rfit)  ## Significant

## Make a comparison plot
### stock values
s <- seq(0,1000,length.out=500)
rr <- rsr(s,a=coef(rfit))
ir <- isr(s,a=coef(ifit))
preds <- data.frame(s=s,rr=rr,ir=ir)
headtail(preds)

## Make the plot
ggplot() +
  geom_line(data=preds,mapping=aes(x=s,y=rr),color="red",size=1) +
  geom_line(data=preds,mapping=aes(x=s,y=ir),color="gray30",size=1) +
  geom_point(data=nim,mapping=aes(x=stock,y=recruits)) +
  scale_x_continuous(name="Number of age-1+ Crappie per hectare") +
  scale_y_continuous(name="Number of age-0+ Crappie per hectare") +
  theme_bw()
