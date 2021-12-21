---
layout: page
title: Class Exercise
subtitle: Mortality II
css: /css/modules.css
---

## Catch Curve Assumption Violations
### Background
The catch-curve method for estimating total instantaneous mortality rates (Z) is based on the following assumptions:

* **Closed Population** -- There is no immigration or emigration to the population.
* **Constant Mortality** -- Z is constant (i.e., independent of age and year for ages on the descending limb of the catch curve).
* **Constant Recruitment** -- The initial number of individuals is the same for each year-class of fish.
* **Constant Vulnerability** -- The vulnerability (*if catch data is used*) or catchability (*if CPUE data is used*) of fish to the gear is constant (i.e., independent of age and year for ages on the descending limb of the catch curve).
* **Unbiased Sample** -- The sample is not biased regarding any specific age-group(s).
* **Accurate Ages** -- The fish in a sample can be accurately assigned an age.

Violations of these assumptions result in catch curves that are "bumpy", convex, concave, or offset rather than linear in the descending limb and may result in biased estimates of Z. Fisheries managers need to understand these biases in order to actively guard against them and to inform careful interpretations of results. The effect of assumption violations on the "shape" of the catch curve and the resultant mortality estimates is the focus of this exercise.
  
### Simulation Description
Slider bars in the gear icon for `catchCurveSim()` allow the user to model violations of these assumptions to see how they alter the shape of the catch curve. These sliders are described below. [*You may have to increase the size of the plot window to see all of these options ... note that there is a "rerandomize" button at the bottom*.]

* `Z mean` - the mean Z to use in the simulations. If `Z CV` (see below) is set to 0 (the default), then this is the exact Z used in the simulations.
* `No mean` - the mean N<sub>0</sub> to use in the simulations. If `No CV` (see below) is set to 0 (the default), then this is the exact N<sub>0</sub> used in the simulations.
* `Z CV` - models random variation in Z (larger values mean a more variable Z).
* `No CV` - models random variation in N<sub>0</sub>.
* `Steady` -- the `Z delta` and `No delta` multipliers (below) are constant for all ages if `Steady` is checked or changes geometrically if `Steady` is unchecked -- i.e., if `Steady` is unchecked, then the values increase or decrease by the multiple for each age after the age given in the `deltaAge=` argument (which is 8 by default).
* `Z delta` - a multiplier used to model *systematic* (i.e., not random) non-constant values of Z. Values greater than 1 indicate an increasing mean Z for ages after the `deltaAge=` age (see previous). Values less than 1 indicate a decreasing mean Z after `deltaAge`. A value of 1 indicates a constant mean Z for all ages.
* `No delta` - a multiplier used to model *systematic* (i.e., not random) non-constant values of N<sub>0</sub>. See `Z delta` above for a description of its use.

A plot will appear with three lines that connect points of log catch-at-age data. Three lines may not be apparent as they may be plotted on top of each other. The gray line is the catch curve at the initial or default values of the simulation (Z=0.4 and N<sub>0</sub>=700 with no assumption violations). This line is provided simply as a reference. The blue line is the catch curve for the current values of Z and N<sub>0</sub> selected by the user (see above) but ignoring any assumption violations modeled by the user. Finally, the red line is the catch curve created by all choices made by the user, including changes to Z and N<sub>0</sub> and any values that simulate assumption violations (see next page). The blue line is plotted after (or on top of) the red line which is after the gray line.

### Observations
Each simulation below should use a maximum age of 15, a starting age for the change of the parameters of 8, Z=0.4, and N<sub>0</sub>=700 (all are the defaults). Before starting each simulation, return all values for the sliders to the defaults and then change only those values noted in the question. For each simulation, describe (with a supporting graphic) the shape of the descending limb of the catch curve using terms like "linear", "bumpy", "concave" (upward parabola-like), "convex" (downward parabola-like), "upward v-shape", "downward v-shape", "offset up", or "offset down". 

1. Model random variability (i.e., CV) in Z.
1. Model random variability in N<sub>0</sub>.
1. Model a steady increase in Z.
1. Model a steady decrease in Z.
1. Model a steady increase in N<sub>0</sub>.
1. Model a steady decrease in N<sub>0</sub>.
1. Model a non-steady increase in Z.
1. Model a non-steady decrease in Z.
1. Model a non-steady increase in N<sub>0</sub>.
1. Model a non-steady decrease in N<sub>0</sub>.

### Summaries

{:start="11"}
1. What could cause a catch curve constructed from real catch-at-age data to be "bumpy"?
1. What could cause a catch curve constructed from real catch-at-age data to be concave?
1. What could cause a catch curve constructed from real catch-at-age data to be v-shaped upward?
1. What could cause a catch curve constructed from real catch-at-age data to be offset a constant amount upward?
1. Construct the following two situations -- (i) a steady 50% greater Z and (ii) the same but including a 10% CV for the Z. Do you observe the same "shape" in the descending limbs of the catch curve in both of these simulations? Explain any differences that you observe.
1. How easy do you think it would be to diagnose the specific assumption violation given a non-linear descending limb on a catch curve constructed from real catch-at-age data? Explain.
