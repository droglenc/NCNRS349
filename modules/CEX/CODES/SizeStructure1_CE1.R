library(FSA)
library(tidyverse)
library(ggplot2)

wc <- read.csv("https://raw.githubusercontent.com/droglenc/NCNRS349/gh-pages/modules/RESOURCES/Whittlesey2011.csv")
str(wc)

## Species1
ggplot(data=filter(wc,species=="Species1"),mapping=aes(x=length)) +
  geom_histogram(binwidth=5,color="black",fill="gray50") +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Frequency of Species1",
                     expand=expansion(mult=c(0,0.03))) +
  theme_bw()

## Species2
ggplot(data=filter(wc,species=="Species2"),mapping=aes(x=length)) +
  geom_histogram(binwidth=5,color="black",fill="gray50") +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Frequency of Species2",
                     expand=expansion(mult=c(0,0.03))) +
  theme_bw()

## Species3
ggplot(data=filter(wc,species=="Species3"),mapping=aes(x=length)) +
  geom_histogram(binwidth=20,color="black",fill="gray50") +
  scale_x_continuous(name="Total Length (mm)") +
  scale_y_continuous(name="Frequency of Species3",
                     expand=expansion(mult=c(0,0.03))) +
  theme_bw()
