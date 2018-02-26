---
layout: page
title: Homework Key
subtitle: Stock-Recruitment
author: Derek H. Ogle
css: /css/modules.css
output:
  html_document:
    self_contained: false
    lib_dir: zlibs
---




```r
library(FSA)
library(FSAdata)
library(nlstools)
library(dplyr)
library(magrittr)

data(WalleyeEL)
WalleyeEL %<>% mutate(logage0=log(age0),logage5=log(age5))
mnS <- mean(WalleyeEL$age5)
rckr <- srFuns(type="Ricker")
ind <- srFuns(type="independence")
```

----

## Escanaba Lake Walleye










