library(FSA)
library(tidyverse)
library(ggplot2)

# Hypothetical "Real Data"
hyp <- data.frame(age=0:5,
                  ct=c(77,111,126,104,81,64))
ggplot(data=hyp,mapping=aes(x=age,y=ct)) +
  geom_point() +
  scale_y_continuous(trans="log") +
  theme_bw()

cc1 <- catchCurve(ct~age,data=hyp,ages2use=2:5,weighted=TRUE)
cbind(Est=coef(cc1),confint(cc1))
plot(cc1)



# Snapper Example
## read data, add length category variable, and make age and length samples
snap <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/SnapperHG1.csv")
str(snap)
unique(snap$survey)
snap <- mutate(snap,lcat=lencat(len,w=1,as.fact=TRUE))  ## as.fact is important!!
snap1 <- filter(snap,survey!="KAH8810")
headtail(snap1)

snap1a <- filter(snap1,!is.na(age))
snap1l <- filter(snap1,is.na(age))

## Make the ALK
agelendist <- xtabs(~lcat+age,data=snap1)
alk <- prop.table(agelendist,margin=1)
alkPlot(alk)

## Assign ages
snap1lmod <- alkIndivAge(alk,age~len,data=snap1l)  ## oops!!!
snap1l <- filter(snap1l,len>=7)
snap1lmod <- alkIndivAge(alk,age~len,data=snap1l)

## Combine two dfs with ages and compute some summaries
snap1amod <- rbind(snap1a,snap1lmod)

lenatage <- snap1amod %>%
  group_by(age) %>%
  summarize(n=n(),
            mntl=mean(len),
            sdtl=sd(len))

ggplot(data=lenatage,mapping=aes(x=age,y=n)) +
  geom_point() +
  scale_y_continuous(trans="log") +
  theme_bw()

cc1 <- catchCurve(n~age,data=lenatage,ages2use=2:18,weighted=TRUE)
cbind(Est=coef(cc1),confint(cc1))
plot(cc1)
