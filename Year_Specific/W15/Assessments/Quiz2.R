library(NCStats)
library(multcomp)
setwd("C:/aaaWork/Class Materials/MTH207/Year_Specific/W15/Assessments")

### TWO-WAY ANOVA
d75 <- read.table("box7_5.txt",header=TRUE)
d75$Month <- factor(d75$Month,levels=c("Jun","Aug"))
d75$Depth <- factor(d75$Depth)
d75$comb <- d75$Depth:d75$Month
str(d75)
lm1 <- lm(CPE~Depth*Month,data=d75)
transChooser(lm1)
anova(lm1)
mc1a <- glht(lm1,mcp(Depth="Tukey"))
confint(mc1a)
mc1b <- glht(lm1,mcp(Month="Tukey"))
confint(mc1b)
lm2 <- lm(CPE~comb,data=d75)
mc2 <- glht(lm2,mcp(comb="Tukey"))
glhtSig(mc2)
windows(9,3); par(mfrow=c(1,3),mar=c(3,3,0.5,0.5),mgp=c(1.7,0.5,0))
fitPlot(lm1,which="Depth",ylim=c(0,45))   # LEFT
fitPlot(lm1,which="Month",ylim=c(0,45))   # CENTER
fitPlot(lm1,ylim=c(0,45),interval=FALSE)  # RIGHT

d75$tCPE <- d75$CPE^(0.5)
lm3 <- lm(tCPE~Depth*Month,data=d75)
anova(lm3)
mc3a <- glht(lm3,mcp(Depth="Tukey"))
confint(mc3a)
mc3b <- glht(lm3,mcp(Month="Tukey"))
confint(mc3b)
lm4 <- lm(CPE~comb,data=d75)
mc4 <- glht(lm4,mcp(comb="Tukey"))
glhtSig(mc4)
fitPlot(lm3,which="Depth",ylim=c(0,7))  # LEFT
fitPlot(lm3,which="Month",ylim=c(0,7))  # CENTER
fitPlot(lm3,ylim=c(0,7),interval=FALSE) # RIGHT




### SLR
lb <- read.csv("LeafBiomass.csv")
lb$logbiomass <- log(lb$biomass)
lb$logspecies <- log(lb$species)
str(lb)

SLR1 <- lm(biomass~species,data=lb)
transChooser(SLR1)
summary(SLR1)
confint(SLR1)
predict(SLR1,data.frame(species=5),interval="prediction")
predict(SLR1,data.frame(species=5),interval="confidence")

SLR2 <- lm(logbiomass~logspecies,data=lb)
summary(SLR2)
confint(SLR2)
predict(SLR2,data.frame(logspecies=log(5)),interval="prediction")
predict(SLR2,data.frame(logspecies=log(5)),interval="confidence")

SLR3 <- lm(species~biomass,data=lb)
transChooser(SLR3)
summary(SLR3)
confint(SLR3)
predict(SLR3,data.frame(biomass=1000),interval="prediction")
predict(SLR3,data.frame(biomass=1000),interval="confidence")

SLR4 <- lm(logspecies~logbiomass,data=lb)
summary(SLR4)
confint(SLR4)
predict(SLR4,data.frame(logbiomass=log(1000)),interval="prediction")
predict(SLR4,data.frame(logbiomass=log(1000)),interval="confidence")
