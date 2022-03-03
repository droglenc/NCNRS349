## Load the required packages
library(FSA)
library(tidyverse)

## Get the data, reduce to Nimrod for this example
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
### Create the Ricker function
rsr <- srFuns("Ricker",msg=TRUE)
### Get starting values
rsv <- srStarts(recruits~stock,data=nim,type="Ricker",plot=TRUE)
### Fit the model
rfit <- nls(log(recruits)~log(rsr(stock,a,b)),data=nim,start=rsv)
( res <- cbind(Est=coef(rfit),confint(rfit)) )
### Estimate of peak recruitment & corresponding S
( Rp <- res["a","Est"]/(res["b","Est"]*exp(1)) )
( Sp <- 1/res["b","Est"] )

## Fit the Independence S-R model
isv <- srStarts(recruits~stock,data=nim,type="independence")
isr <- srFuns("independence")
ifit <- nls(log(recruits)~log(isr(stock,a)),data=nim,start=isv)

## Compare models
extraSS(ifit,com=rfit)  ## Significant (p<0.05)

## Make a comparison plot
ggplot(data=nim,mapping=aes(x=stock,y=recruits)) +
  geom_point() +
  stat_function(fun=rsr,args=list(a=coef(rfit)),color="red",size=1) +
  stat_function(fun=isr,args=list(a=coef(ifit)),color="black",size=1) +
  scale_x_continuous(name="Number of age-1+ Crappie per hectare",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.01))) +
  scale_y_continuous(name="Number of age-0+ Crappie per hectare",
                     limits=c(0,NA),expand=expansion(mult=c(0,0.01))) +
  theme_bw()

## Predictions
# Predict at Sp for both models
rsr(Sp,a=coef(rfit))
isr(Sp,a=coef(ifit))

# Predict at S=200 for both models
rsr(200,a=coef(rfit))
isr(200,a=coef(ifit))
