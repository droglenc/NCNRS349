---
layout: page
title: Assignment
subtitle: Stock-Recruitment
css: /css/modules.css
---

## Escanaba Lake Walleye
[Hansen *et al.*](http://www.tandfonline.com/doi/abs/10.1577/1548-8675%281998%29018%3C0764%3AFAROWI%3E2.0.CO%3B2?journalCode=ujfm20) (1998) modeled recruitment variation of age-0 [Walleye](https://en.wikipedia.org/wiki/Walleye) (*Sander vitreus*) in [Escanaba Lake](http://dnr.wi.gov/lakes/lakepages/LakeDetail.aspx?wbic=2339900&page=facts) (Wisconsin) to determine factors regulating their abundance. Specifically, they examined the abundance of age-5 and older Walleye (spawning population), variation in May water temperatures, and abundance of 152.4 mm total length and longer [Yellow Perch](https://en.wikipedia.org/wiki/Yellow_perch) (*Perca flavescens*) on the abundance of age-0 Walleye. These data are available in WalleyeEL.csv ([data](https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/WalleyeEL.csv), [Meta](http://derekogle.com/fishR/data/data-html/WalleyeEL.html)).

Load these data into R to answer the following questions.

1. Which variable should be considered the "recruits"?  Which variable should be considered the "spawning stock?"  Explain.
1. From an appropriate plot, describe the relationship between "recruits" and "stock."  Do you expect a stock-recruitment model to fit these data well?
1. Fit the following recruitment functions to these data, assuming a multiplicative error structure. Show your results by expressing the equation of the recruitment function with the parameters replaced by their estimated values.
    1. Density-independence.
    1. Ricker.
1. Construct a single plot that shows how well each recruitment function fits these data.
1. Estimate recruitment for the mean stock level (=1178 age-5+ fish) with each recruitment function. How variable are the results among models?
1. Determine if the density-dependent parameter is statistically significant in the Ricker model.
