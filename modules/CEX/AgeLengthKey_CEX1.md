---
layout: page
title: Class Exercise
subtitle: Age-Length Key
css: /css/modules.css
---

## Atlantic Ocean Striped Bass I
Researchers at the [Center for Quantitative Fisheries Ecology at Old Dominion University](http://www.odu.edu/sci/research/cqfe/research/) in collaboration with the [Virginia Marine Resources Commission](http://www.mrc.virginia.gov/) annually collect [Striped Bass](https://en.wikipedia.org/wiki/Striped_bass) (*Morone saxatilis*) from Virginia waters of the Atlantic Ocean for age assessments. The total lengths of 1201 Stiped Bass collected in 2003 and the ages estimated from [otoliths](https://en.wikipedia.org/wiki/Otolith) for as many as 10 fish per 1 inch length interval are recorded in StripedBass3.csv ([Data](https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/StripedBass3.csv), [Meta](http://derekogle.com/fishR/data/data-html/StripedBass3.html)).

1. Separate the observed data into age- and length-samples. How many fish are in each sample?
1. Add a variable to the age-sample that contains the 1 inch TL categories. Construct a table of the **number** (not proportion) of fish in each age and 1 inch TL category in the age-sample. From these results, compute each of the following *by hand* (i.e., not using R).
    1. How many fish in the age-sample are in the 30 in TL category?
    1. How many age-10 fish are in the age-sample?
    1. What proportion of fish in the 35 in TL category are age 9?
    1. What proportion of fish in the 31 in TL category are age 11?
1. Construct an **observed** age-length key from the table above (using R). From these results answer the following questions.
    a. What proportion of fish in the 30 in TL category should be assigned age 10?
    a. How many of fourty fish in the 25 mm TL category should be assigned age 5?
    a. Construct a plot of the **observed** age-length key. Are there any potential anomalies in the plot that would suggest that a smoothed age-length key could be appropriate?

&nbsp;

## Atlantic Ocean Striped Bass II
Continue with the same data, age- and length- samples, and age-length key used above.

1. Use the semi-random age assignment technique from Isermann and Knight (2005) and the **observed** age-length key to assign ages to the unaged fish in the length-sample. Combine the age-sample and the age-assigned length-sample into a single data frame, add a variable to this data.frame that contains the 1 inch TL categories, and use the combined data frame to answer the following questions.
    a. How many fish are estimated to be age 8?
    a. How many fish are estimated to be age 14?
    a. Plot the age distribution for all fish.
    a. How many fish are in the 30 in TL interval?
    a. What is the mean TL of age-9 fish?
    a. Plot the length-at-age with the mean length-at-age superimposed for all fish.
1. Compare your results from the previous question to someone else's results (or repeat the previous question). Did you both get the *exact* same results? Why or why not? If not, how different were they?

&nbsp;

## Atlantic Ocean Striped Bass III
Continue with the same data, age- and length- samples, and age-length key used above.

1. Use the "classical" method to estimate the age distribution (with standard errors) for all sampled fish.
    a. How many fish are estimated to be age 8?
    a. How many fish are estimated to be age 14?
    a. Plot the age distribution for all fish.
1. Use the "classical" method to estimate the mean length-at-age (with standard deviations) for all sampled fish.
    a. What is the mean TL of age-9 fish?
    a. Plot the length-at-age with the mean length-at-age superimposed for all fish.
1. Compare your results to someone else's results (or repeat the steps above). Did you both get the *exact* same results? Why or why not? If not, how different were they?
1. Compare your results using the "classical" method here to your results from using the Isermann and Knight (2005) method in the first part above.
