library(FSA)
library(tidyverse)

## Get Data
df <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/InchLake2.csv")
str(df)
peek(df)
unique(df$species)
unique(df$year)

df <- df %>%
  mutate(length=length*25.4,
         loglen=log10(length),
         logwt=log10(weight))

lmb <- filter(df,species=="Largemouth Bass")

## Weight-Length Relationship
ggplot(data=lmb,mapping=aes(x=length,y=weight)) +
  geom_point() +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Weight (g)") +
  theme_bw()

ggplot(data=lmb,mapping=aes(x=loglen,y=logwt)) +
  geom_point() +
  scale_x_continuous(name="log Total Length (mm)") +
  scale_y_continuous(name="log Weight (g)") +
  theme_bw()

lwr <- lm(logwt~loglen,data=lmb)
cbind(Est=coef(lwr),confint(lwr))

ggplot(data=lmb,mapping=aes(x=loglen,y=logwt)) +
  geom_point() +
  geom_smooth(method="lm",color="blue") +
  scale_x_continuous(name="log Total Length (mm)") +
  scale_y_continuous(name="log Weight (g)") +
  theme_bw()

( p <- predict(lwr,data.frame(loglen=log10(c(100,275,300)))) )
10^p



## Condition Analysis
wsVal("Largemouth Bass")

lmb <- filter(df,species=="Largemouth Bass",length>=150) %>%
  mutate(ws=10^(-5.528+3.273*loglen),
         wr=weight/ws*100,
         gcat=psdAdd(length,species="Largemouth Bass"))

peek(lmb)

lmb08 <- filter(lmb,year==2008)

Summarize(wr~gcat,data=lmb08,digits=1)

ggplot(data=lmb08,mapping=aes(x=gcat,y=wr)) +
  stat_summary(fun=mean,geom="point") +
  stat_summary(fun.data=mean_cl_normal,geom="errorbar",width=0.1) +
  scale_x_discrete(name="Length Category") +
  scale_y_continuous(name="Relative Weight") +
  theme_bw()

aov1 <- lm(wr~gcat,data=lmb08)
anova(aov1)
