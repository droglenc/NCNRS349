library(FSA)
library(tidyverse)
library(ggplot2)

# Example
pe1 <- mrClosed(M=99,n=101,m=17,method="Chapman")
cbind(summary(pe1),confint(pe1,verbose=TRUE))
