---
layout: page
title: Exercise
subtitle: Age-Length Key
---

## Lake Ontario Rock Bass I
[Wolfert (1980)](https://pubs.er.usgs.gov/publication/1000461) measured the total length (TL) of 1288 [Rock Bass](https://en.wikipedia.o.rg/wiki/Rock_bass) (*Ambloplites rupestris*) from Eastern [Lake Ontario](https://en.wikipedia.org/wiki/Lake_Ontario) in the late 1970s. In addition, [scales](https://en.wikipedia.org/wiki/Fish_scale) were removed for age estimation from as many as 10 specimens from each 10 mm length interval. All data are recorded in RockBassLO2.csv ([Data](https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/RockBassLO2.csv), [Meta](http://derekogle.com/fishR/data/data-html/RockBassLO2.html)). [*Note that the filename contains an "oh" not a "zero."*].

1. Separate the observed data into age- and length-samples. How many fish are in each sample?
1. Add a variable to the age-sample that contains the 10 mm TL categories. Construct a table of the **number** (not proportion) of fish in each age and 10 mm TL category in the age-sample. From these results, compute each of the following *by hand* (i.e., not using R).
    a. How many Rock Bass in the age-sample are in the 180 mm TL category?
    a. How many age-7 Rock Bass are in the age-sample?
    a. What proportion of Rock Bass in the 140 mm TL category are age 4?
    a. What proportion of Rock Bass in the 200 mm TL category are age 8?
1. Construct an **observed** age-length key from the table above (using R). From these results answer the following questions.
    a. What proportion of Rock Bass in the 210 mm TL category should be assigned age 5?
    a. How many of thirty Rock Bass in the 180 mm TL category should be assigned age 5?
    a. Construct a plot of the **observed** age-length key. Are there any potential anomalies in the plot that would suggest that a smoothed age-length key could be appropriate?

&nbsp;

## Lake Ontario Rock Bass II
Continue with the same data, age- and length- samples, and age-length key used above.

1. Use the semi-random age assignment technique from Isermann and Knight (2005) and the **observed** age-length key to assign ages to the unaged fish in the length-sample. Combine the age-sample and the age-assigned length-sample into a single data frame, add a variable to this data.frame that contains the 10 mm TL categories, and use the combined data frame to answer the following questions.
    a. How many fish are estimated to be age 5?
    a. How many fish are estimated to be age 11?
    a. Plot the age distribution for all fish.
    a. How many fish are in the 150 mm TL interval?
    a. What is the mean TL of age-5 fish?
    a. Plot the length-at-age with the mean length-at-age superimposed for all fish.
