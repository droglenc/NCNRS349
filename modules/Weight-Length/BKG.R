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

figcaps <- captioner(prefix="Figure")
figcaps("LengthMeasures","Demonstration of total, fork, and standard length measurements on a Bluegill.")
figcaps("LengthWeightMeasure","Field measurements of length (left) and weight with a spring scale (right).")
figcaps("RuffeRawLW","Length and weight of Ruffe from the St. Louis River Harbor, 1992.")
figcaps("RuffeTransLW",'Natural log transformed total length and weight of Ruffe from the St. Louis River Harbor, 1992.  Note that the "flaring" of the values in the lower-left corner of the plot is due to minimum weight limitations of the measuring scale.')

tblcaps <- captioner(prefix="Table")
tblcaps("LWDataEx","Length and weight measurements for a portion of Ruffe from the St. Louis River Harbor, 1992.")

eqncaps <- captioner(prefix="Equation")
eqncaps("LWModel")
eqncaps("LWTransformModel")
# ===== END -- THIS CAN BE IGNORED ===========================

data(RuffeSLRH92)
ruffe2 <- RuffeSLRH92 %>%
  filterD(!is.na(weight),!is.na(length)) %>%
  mutate(logL=log(length),logW=log(weight))

plot(weight~length,data=ruffe2,pch=19,
     xlab="Total Length (mm)",ylab="Weight (g)",xlim=c(0,200),cex=0.5)

plot(logW~logL,data=ruffe2,pch=19,
     xlab="log Total Length (mm)",ylab="log Weight (g)",cex=0.5)


# Script created at 2018-01-02 16:41:41
