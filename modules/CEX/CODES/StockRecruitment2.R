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
sv <- srStarts(recruits~stock,data=nim,type="Ricker",plot=TRUE)
### Create the Ricker function
rsr <- srFuns("Ricker",msg=TRUE)
### Fit the model
fit1 <- nls(log(recruits)~log(rsr(stock,a,b)),data=nim,start=sv)
summary(fit1)
cbind(Est=coef(fit1),confint(fit1))

## Fit the Independence S-R model
