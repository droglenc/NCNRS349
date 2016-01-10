# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","captioner","knitr")
library(FSA)
library(FSAdata)
# setup figure, table, and equation captioning
library(captioner)

figcaps <- captioner(prefix="Figure")
figcaps("","")

tblcaps <- captioner(prefix="Table")
tblcaps("PSDRanges","Suggested target ranges for size structure indices for a variety of species.  From @Willisetal1993.")
tblcaps("MgmtOpts","Suggested target ranges for size structure indices for Largemouth Bass and Bluegill under three different management options.  From @Willisetal1993.")

eqncaps <- captioner(prefix="Equation")
eqncaps("")
# ===== END -- THIS CAN BE IGNORED ===========================

( bg.cuts <- psdVal("Bluegill",units="in") )


# Script created at 2016-01-10 17:09:07
