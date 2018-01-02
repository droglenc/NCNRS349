# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","FSAdata","captioner","knitr","dplyr","magrittr")
library(FSA)
library(FSAdata)
library(dplyr)
library(magrittr)
# setup figure, table, and equation captioning
library(captioner)
eqncaps <- captioner(prefix="Equation")
eqncaps("RelativeWeight")
# ===== END -- THIS CAN BE IGNORED ===========================

data(RuffeSLRH92)
ruffe2 <- RuffeSLRH92 %>%
  filterD(!is.na(weight),!is.na(length)) %>%
  mutate(logL=log(length),logW=log(weight))


# Script created at 2018-01-02 13:47:51
