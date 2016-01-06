---
layout: page
title: Mortality
subtitle: Class Exercise
css: "/css/modules.css"
---

----

## Assumptions Violations in Catch Curve Mortality Estimates

#### Background

The catch-curve method for estimating total morality rates ($Z$) is based on the following assumptions:

* **Closed Population}** -- There is no immigration or emigration to the population.
* **Constant Mortality** -- $$Z$$ is constant (i.e., independent of age and year for ages on the descending limb of the catch curve).
* **Constant Recruitment** -- The initial number of individuals is the same for each year-class of fish.
* **Constant Vulnerability** -- The vulnerability (*if catch data is used*) or catchability (*if CPUE data is used*) of fish to the gear is constant (i.e., independent of age and year for ages on the descending limb of the catch curve).
* **Unbiased Sample** -- The sample is not biased regarding any specific age-group(s).
* **Accurate Ages** -- The fish in a sample can be accurately assigned an age.

Violations of these assumptions result in catch curves that are "bumpy", convex, concave, or offset rather than linear in the descending limb and may result in biased estimates of mortality rates.  Fisheries managers need to understand these biases in order to actively guard against them and to inform careful interpretations of results.  The effect of assumption violations on the "shape" of the catch curve and the resultant mortality estimates is the focus of this exercise.
  
#### Simulation Description

Other slide bars in the gear icon for `catchCurveSim()` allow the user to model violations of these assumptions to see how they alter the shape of the catch curve.  These sliders are descrbed below.

* `Z CV` - models random variation in $Z$; the larger the value, the more variable the $Z$
* `No CV` - models random variation in the $N_{0}$.
* `Steady` -- the `Z delta` and `No delta` multipliers (below) are constant for all ages if checked or change geometrically if unchecked -- i.e., if unchecked then the values increase or decrease by the multiple for each age after `deltaAge`.
* `Z delta` - a multiplier used to model a *systematic* (i.e., not random) non-constant $Z$.  Values greater than 1 indicate an increasing mean $Z$ for ages after the value given in `deltaAge` (see previous).  Values less than 1 indicate a decreasing mean $Z$ after `deltaAge`.  A value of 1 indicates a constant mean $Z$ across all ages.
* `No delta` - a multiplier used to model a *systematic* (i.e., not random) non-constant $N_{0}$.  See `Z delta` above for a description of its use.

----

#### Questions II

Each simulation below should use a maximum age of 15, a starting age for the change of 8, and $Z=0.4$ and $N_{0}=700$ (all are the defaults).  Before starting each simulation, return all values to the defaults and then change only those values noted in the question.  For each simulation, describe (with a supporting graphic) the shape of the descending limb of the catch curve using terms like "linear", "bumpy", "concave" (upward parabola-like), "convex" (downward parabola-like), "upward v-shape", "downward v-shape", "offset up", or "offset down". 

1. Model random variability (i.e., CV) in $Z$.
1. Model random variability in $N_{0}$.
1. Model a steady increase in $Z$.
1. Model a steady decrease in $Z$.
1. Model a steady increase in $N_{0}$.
1. Model a steady decrease in $N_{0}$.
1. Model a non-steady increase in $Z$.
1. Model a non-steady decrease in $Z$.
1. Model a non-steady increase in $N_{0}$.
1. Model a non-steady decrease in $N_{0}$.


----

#### Questions III

1. What could cause a catch curve constructed from real catch-at-age data to be "bumpy"?
1. What could cause a catch curve constructed from real catch-at-age data to be concave?
1. What could cause a catch curve constructed from real catch-at-age data to be v-shaped upward?
1. What could cause a catch curve constructed from real catch-at-age data to be offset a constant amount upward?
1. Construct the following two situations -- (i) a steady 50% greater $Z$ and (ii) the same but including a 10% CV for the $Z$.  Do you observe the same "shape" in the descending limbs of the catch curve in both of these simulations?  Explain any differences that you observe.
1. How easy do you think it would be to diagnose the specific assumption violation given a non-linear descending limb on a catch curve constructed from real catch-at-age data?  Explain.


----

<div class="text-center">
<ul class="pagination pagination-lg">
  <li><a href="../../index.html">^</a></li>
  <li><a href="CE1.html">1</a></li>
  <li class="active"><a href="#">2</a></li>
</ul>
