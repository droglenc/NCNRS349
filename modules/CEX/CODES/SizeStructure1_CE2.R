library(FSA)
library(tidyverse)

bg <- read.csv("https://raw.githubusercontent.com/droglenc/NCNRS349/gh-pages/modules/CEX/LakeLouiseBG.csv")
str(bg)

ggplot(data=bg,mapping=aes(x=len,fill=gear)) +
  geom_histogram(binwidth=10,boundary=0,color="black") +
  scale_x_continuous(name="Total Length (mm)",breaks=seq(60,240,20)) +
  scale_y_continuous(name="Frequency",expand=expansion(mult=c(0,0.03))) +
  theme_bw() +
  facet_wrap(vars(gear),ncol=1,scales="free_y") +
  theme(legend.position="none")

ggplot(data=bg,mapping=aes(x=len,color=gear)) +
  stat_ecdf(size=1) +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Cumulative Density",expand=expansion(mult=0)) +
  theme_bw()

ksTest(len~as.factor(gear),data=bg)

Summarize(len~gear,data=bg,digits=1)

t.test(len~gear,data=bg)

