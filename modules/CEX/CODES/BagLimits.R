library(FSAdata)
library(tidyverse)

## Walleye
wae <- filter(CreelMN,species=="WAE")
waelmt <- 1
( ttlwae <- sum(wae$harvest) )        
# Number of fish if reduced to lmt
wae$svd <- wae$harvest-waelmt
xtabs(~svd,data=wae)
( svd <- sum(wae$svd[wae$svd>0]) )
round(svd/ttlwae*100,1)

## Yellow Perch
yep <- filter(CreelMN,species=="YEP")
yeplmt <- 7
( ttlyep <- sum(yep$harvest) )        
# Number of fish if reduced to lmt
yep$svd <- yep$harvest-yeplmt
xtabs(~svd,data=yep)
( svd <- sum(yep$svd[yep$svd>0]) )
round(svd/ttlyep*100,1)


## Largemouth Bass
lmb <- filter(CreelMN,species=="LMB")
lmblmt <- 3
( ttllmb <- sum(lmb$harvest) )        
# Number of fish if reduced to lmt
lmb$svd <- lmb$harvest-lmblmt
xtabs(~svd,data=lmb)
( svd <- sum(lmb$svd[lmb$svd>0]) )
round(svd/ttllmb*100,1)


## Sunfish
sun <- filter(CreelMN,species=="Sunfish")
sunlmt <- 12
( ttlsun <- sum(sun$harvest) )        
# Number of fish if reduced to lmt
sun$svd <- sun$harvest-sunlmt
xtabs(~svd,data=sun)
( svd <- sum(sun$svd[sun$svd>0]) )
round(svd/ttlsun*100,1)


## Northern Pike
nop <- filter(CreelMN,species=="NOP")
noplmt <- 2
( ttlnop <- sum(nop$harvest) )        
# Number of fish if reduced to lmt
nop$svd <- nop$harvest-noplmt
xtabs(~svd,data=nop)
( svd <- sum(nop$svd[nop$svd>0]) )
round(svd/ttlnop*100,1)


## Crappie
crap <- filter(CreelMN,species=="Crappie")
craplmt <- 5
( ttlcrap <- sum(crap$harvest) )        
# Number of fish if reduced to lmt
crap$svd <- crap$harvest-craplmt
xtabs(~svd,data=crap)
( svd <- sum(crap$svd[crap$svd>0]) )
round(svd/ttlcrap*100,1)
