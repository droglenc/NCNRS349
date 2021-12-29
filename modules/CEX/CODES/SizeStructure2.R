library(FSA)
library(tidyverse)
library(ggplot2)

yp <- read.csv("https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/YPerchSB1.csv")
str(yp)

psdVal("Yellow Perch",unit="cm")

ypin <- yp %>%
  filter(loc=="inner") %>%
  mutate(lcat10=lencat(tl,w=1),
         gcat=psdAdd(tl,species="Yellow Perch",unit="cm"))

head(ypin)

( freq <- xtabs(~lcat10,data=ypin) )

ggplot(data=ypin,mapping=aes(x=tl)) +
  geom_histogram(binwidth=1,boundary=0,color="black",fill="gray50") +
  scale_x_continuous(name="Total Length (cm)",breaks=seq(5,30,5)) +
  scale_y_continuous(name="Frequency",expand=expansion(mult=c(0,0.03))) +
  theme_bw()

( freq2 <- xtabs(~gcat,data=droplevels(filter(ypin,gcat!="substock"))) )

( psd_incs <- prop.table(freq2) )
( psds <- rcumsum(psd_incs) )
