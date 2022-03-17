---
layout: page
title: Assignment
subtitle: Stock-Recruitment
css: /css/modules.css
---

## Alaskan Slimy Sculpins I
The total length (mm) and otolith age of [Slimy Sculpin](https://en.wikipedia.org/wiki/Slimy_sculpin) (*Cottus cognatus*) captured in the [Arctic Long-Term Ecological Research](http://ecosystems.mbl.edu/ARC/) area were recorded in SculpinAlter.csv ([Data](https://raw.githubusercontent.com/droglenc/FSAdata/master/data-raw/SculpinALTER.csv), [Meta](http://derekogle.com/fishR/data/data-html/SculpinALTER.html)).

Use these data to answer the following questions.

1. Plot TL versus age. Observe the "shape" of the data (do the results look linear or like a von Bertalanffy growth curve, is there an obvious asymptote, are young fish well represented, how variable are lengths within ages).


Fit the typical parameterization of the von Bertalanffy growth function (VBGF).

{:start="2"}
1. Plot TL versus age and superimpose the best-fit VBGF. Comment on model fit.
1. Write the equation for the typical VBGF with parameters replaced by their estimated values.
1. How realistic do the point estimates of L<sub>&infin;</sub>, K, and t<sub>0</sub> seem?
1. Carefully interpret the meaning of each parameter.
1. Construct 95% bootstrapped confidence intervals for each parameter. Comment on the widths of these confidence intervals. What explains this?
1. Predict the mean TL, with 95% confidence interval, for an age-3 Slimy Sculpin. Comment on the width of this confidence interval. What explains this?
1. Predict the age at which the Slimy Sculpins will have reached half of the asymptotic mean TL.

&nbsp;

## Alaskan Slimy Sculpins II
Fit Gallucci and Quinn parameterization of the von Bertalanffy model.

{:start="9"}
1. Write the equation for this VBGF with parameters replaced by their estimated values.
1. Carefully interpret the meaning of each parameter?
1. How does the estimate of K and t<sub>0</sub> from fitting this parameterization compare to that from the typical VBGF fit above. Explain your observation.
1. Show how the estimate of &omega; in this parameterization can be calculated from parameter estimates in the typical parameterization.
