# 

# ===== BEGIN -- THIS CAN BE IGNORED =========================
# Setup of knitr
source("../../../rhelpers/knitr_setup.R")
# declare packages used
rqrd <- c("FSA","captioner","knitr")
library(FSA)
# setup figure, table, and equation captioning
library(captioner)

tblcaps <- captioner(prefix="Table")
tblcaps("PetersenDataMatrix","Summary data matrix for the two samples in a Petersen mark-recapture framework.  Note that a zero indicates the fish were not captured in that sample and a one indicates that the fish were captured in that sample.")
tblcaps("PetersenNotation","Summary of notation used in the Petersen method.")
tblcaps("SchnabelNotation","Summary of notation used in the Schnabel and Schumacher-Eschmeyer methods.")

figcaps <- captioner(prefix="Figure")
figcaps("PetersenScheme","Schematic representation of the two samples ($i=1,2$) in a Petersen mark-recapture study.  See the text for detailed description and Table 2 for definitions of notation.")
figcaps("SchnabelScheme","Schematic representation of a hypothetical four samples ($i=1,2,3,4$) in a Schnabel or Shumacher-Eschmeyer mark-recapture study.  See the text for detailed description and Table 3 for definitions of notation.")

eqncaps <- captioner(prefix="Equation")
eqncaps("Petersen")
eqncaps("Chapman")
eqncaps("Bailey")
eqncaps("Schnabel")
eqncaps("SchnabelChapman")
eqncaps("SchumacherEschmeyer")

# ===== END -- THIS CAN BE IGNORED ===========================


# Script created at 2015-12-24 17:24:07
