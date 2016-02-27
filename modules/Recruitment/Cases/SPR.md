---
layout: page
title: Controlling an Invasive Species
subtitle: A Case Study
author: Derek H. Ogle
css: /css/modules.css
---

----

## Introduction

The spawning potential ratio (SPR) is a metric that is used to examine how lifetime egg production ($P$) is affected under different management scenarios.  It is computed as the ratio of lifetime egg production under exploitation divided by lifetime egg production with no exploitation; e.g.,

$$ SPR=\frac{P_{exploited}}{P_{unexploited}} $$

Lifetime egg production is computed with

$$ P = \sum_{i=1}^{n} \mu_{i}E_{i}S_{i} $$

where $n$ is the number of groups in the population (ages or length categories), $\mu_{i}$ is the proportion of females in the $i$th group that are mature, $E_{i}$ is the mean fecundity (number of eggs) in the absence of density-dependent effects on growth, maturity, or fecundity for mature fmales in the $i$th group, and $S_{i}$ is the cumulative survival rate (i.e., survivorship) of females from hatch to the $i$th group.  The $S_{i}$ are computed as
 
$$ S_{i} = \prod_{j=0}^{i-1} S_{ij}  $$

where $S_{ij}$ is the annual rate of survival of females in the $i$th group when they were in the $j$the group.  The $S_{ij}$ are equal to $e^{F_{ij}+M{ij}$ where $S_{ij}$ is the instantaneous fishing mortality and $S_{ij}$ is the instantaneous natural mortality of females in the $i$th group when they were in the $j$th group.

As a very general rule-of-thumb, it has been suggested that SPR values greater than 0.20 or 0.30 will result in no recruitment over-fishing.

#### Motivation

One method of controlling some invasive species is to develop extract-and-kill fisheries for those fish.  It has been suggested that such a method could use commercial fisherman on the Mississippi River to control invasive Silver Carp ().  For example, it has been proposed that commercial fisherman could be paid for the biomass of Silver Carp that they removed from the Mississippi River.  An open question, though, is whether commercial fishers can remove enough Silver Carp to effectively reduce the population (while still making it worth their while commercially).  One way to answer this question is to determine if commericial fishers could realistically force the SPR below 0.20, a value that would lead to recruitment over-fishing and, in theory, a collapse of the population.

## Create a Model

Suppose that a population of Silver Carp ...

* is vulnerable to harvest by commercial fishers for total lengths between 200 and 900 mm.
* has an instantaneous natural mortality of 0.25.
* has a maturity schedule that follows this equation -- $ PR(mature)=\frac{1}{1-e^{-15-0.04*TL}} $.
* has a fecundity-length relationshop that follows this equation -- $ Fecundity=e^{-16+0.004*TL} $.

Use this information to create a spreadsheet model that can be used to compute the SPR under various levels of instantaneous fishing mortality ($F$) and gear selectivities.  Your model should use 50-mm length categories and be flexible enough for you to input different values of $F$ and selectivities to see the effect on SPR.

## Scenarios

Construct similar length- and age-frequency histograms and PSD and PSD-P calculations for each species from the **POST-ANGLING** period.  Use this information to answer the following questions.

<ol start="5">
  <li>Assess the length- and age-frequency histograms for Bluegill, Pumpkinseed, Yellow Perch, and Largemouth Bass from Mid Lake after angler exploitation was allowed.</li>
  <li>Write a clear paragraph, for each species, that compares the pre- and post-angling size- and age-structure results.</li>
  <li>How did your summaries from the previous question compare to your expectations from before seeing the post-angling results?  Suggest possible reasons for any differences.</li>
  <li>How do you suppose the annual mortality rate differed between the two periods for each species?  Use specific evidence to support your supposition.</li>
</ol>

----

<div class="text-center">
<ul class="pagination pagination-lg">
  <li><a href="index.html">^</a></li>
  <li><a href="GoeddeCoble.html">1</a></li>
  <li class="active"><a href="#">2</a></li>
</ul>
