library(FSA)

# Ruffe Extirpation
## Enter data
ct <- c(282,346,37,4,9,27,4,0,1,0)
ft <- c(19.0,30.0,31.0,20.0,29.5,42.5,34.5,36.0,27.0,25.0)
ft <- ft/60
( cpet <- ct/ft )

les <- depletion(ct,ft,method="Leslie")
(res <- cbind(Est=coef(les),confint(les)) )
1-exp(-res["q","Est"])  # proportion removed per hour of fishing
plot(les)


# Crayfish Abundance
rmvl <- removal(c(1477,133,46))
(res2 <- cbind(Est=summary(rmvl),confint(rmvl)) )

rmvlm <- removal(c(1477,133,46),method="Moran")
rmvls <- removal(c(1477,133,46),method="Schnute")
teststat <- 2*(rmvlm$min.nlogLH-rmvls$min.nlogLH)     # Moran - Schnute
( pvalue <- pchisq(teststat,df=1,lower.tail=FALSE) )
