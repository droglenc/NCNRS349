library(FSA)
library(tidyverse)
library(ggplot2)

## read data, add length category variable, and make age and length samples
sb <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/StripedBass3.csv")
str(sb)
sb <- mutate(sb,lcat=lencat(tl,w=1,as.fact=TRUE))  ## as.fact is important!!
headtail(sb)

## separate into age- and length-samples
sba <- filter(sb,!is.na(age))
sbl <- filter(sb,is.na(age))

## age distributions in age sample (and the ALK)
(agelendist <- xtabs(~lcat+age,data=sb))
print(agelendist,zero.print="-")            # aesthetic trick
alk <- prop.table(agelendist,margin=1)
print(round(alk,digits=2),zero.print="-")   # aesthetic trick
alkPlot(alk)

## Assign ages
sblmod <- alkIndivAge(alk,age~tl,data=sbl)
headtail(sbl)
headtail(sblmod)

## Combine two dfs with ages and compute some summaries
sbamod <- rbind(sba,sblmod)

(agedist <- xtabs(~age,data=sbamod))
ggplot(data=sbamod,mapping=aes(x=age)) +
  geom_bar() +
  scale_x_continuous(name="Age") +
  scale_y_continuous(name="Frequency of Fish",expand=expansion(c(0,0.05))) +
  theme_bw()

(lendist <- xtabs(~lcat,data=sbamod))

lenatage <- sbamod %>%
  group_by(age) %>%
  summarize(n=n(),
            mntl=mean(tl),
            sdtl=sd(tl))
lenatage

ggplot() +
  geom_point(data=sbamod,mapping=aes(x=age,y=tl),color=col2rgbt("black",1/10)) +
  geom_line(data=lenatage,mapping=aes(x=age,y=mntl),color="blue",size=1) +
  scale_x_continuous(name="Age") +
  scale_y_continuous(name="Total length (cm)") +
  theme_bw()


## Classical Methods
len.n <- xtabs(~lcat,data=sbl)
lenA.n <- xtabs(~lcat,data=sba)
alkAgeDist(alk,lenA.n,len.n)
alkMeanVar(alk,tl~lcat+age,data=sba,len.n=len.n)

