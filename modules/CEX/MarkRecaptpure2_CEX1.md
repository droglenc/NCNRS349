---
layout: page
title: Class Exercise
subtitle: Class Introduction
css: /css/modules.css
---

## Assumption Violations -- Expectations
For each situation below, identify whether you think that the INITIAL population abundance will be over, under, or accurately estimated by the Chapman modification method. Provide a reasoning for each of your answers.

1. Marked individuals lose their mark (or tag) before the second sample.
1. Marked and unmarked individuals suffer mortality (at the same rate) before the second sample.
1. **M**arked, but not unmarked, individuals suffer mortality before the second sample.
1. Unmarked, but not marked, individuals suffer mortality before the second sample.
1. **I**ndividuals recruit (or migrate) into the population between the first and second samples.
1. Marked individuals show a higher catchability in the second sample (i.e., "trap happy") compared to unmarked individuals.
1. Marked individuals show a lower catchability in the second sample (i.e., "trap shy") compared to unmarked individuals.
1. Technicians do not notice some marked fish in the second sample.
1. Marked fish are released next to the nets used to take the second sample.

&nbsp;

## Assumption Violations -- Observations
The `mrClosed1Sim()` function in the `FSAsim` package was introduced on the [first page of this exercise](CE2a.html). That function can also be used to assess assumption violations by including the `sim="assumptions"` argument.

The same type of histogram will be produced as described earlier. However, in some simulations the population will not be closed and thus a final population abundance will exist and may be different than the initial population abundace. Thus, this histogram will be further augmented with a blue vertical line at the mean final population abundance and the percentage error of the population abundance estimated from this value will be computed and printed on the graph.

```{r fig.width=6,fig.height=4}
mrClosed1Sim(sim="assumptions")
```

As before, this plot will have a gear icon in the upper-left corner that will open a dialog box that allows you to change the estimation method (default is Chapman) and several population values as described below.

* `PR(Mark Loss)` is the probability of losing the mark between the first and second samples. A value of zero (the default) indicates no tag loss.
* `PR(Surv Tagged)` is the probability of survival for marked fish between the first and second samples. A value of one (the default) indicates no complete survival (i.e., no mortality).
* `PR(Surv UNtagged)` is the probability of survival for unmarked fish between the first and second samples. If this value is the same as `PR(Surv Marked)`, then survival/mortality does not differ between marked and unmarked fish.
* `Proportion Recruit` is the proportion of the population alive after the first sample that will recruit to the population prior to the second sample. A value of zero (the default) indicates no recruitment.
* `PR(Capture) Ratio (M/U)` is the ratio of the probability of capture of marked fish to the probability of capture of unmarkd fish for the second sample. Values greater than one indicate that marked fish are more likely to be captured than unmarked fish, whereas values less than one indicate that marked fish are less likely to be captured than unmarked fish. A value of one (the default) indicates that the probabilities of capture are the same between marked and unmarked fish.

Note that the title to the plot will describe the type of assumption violation (if any) being simulated. You also may need to make the plot pane larger to see the entire set of gear options.

----

#### Observations from Violated Assumptions
The `mrClosed1Sim()` function in the `FSAsim` package can be used to assess assumption violations in the mark-recapture method. The use of the function will be described in class. However, note below the meanings of each slider bar.

* `PR(Mark Loss)` is the probability of losing the mark between the first and second samples. A value of zero (the default) indicates no tag loss.
* `PR(Surv Tagged)` is the probability of survival for marked fish between the first and second samples. A value of one (the default) indicates no complete survival (i.e., no mortality).
* `PR(Surv UNtagged)` is the probability of survival for unmarked fish between the first and second samples. If this value is the same as `PR(Surv Marked)`, then survival/mortality does not differ between marked and unmarked fish.
* `Proportion Recruit` is the proportion of the population alive after the first sample that will recruit to the population prior to the second sample. A value of zero (the default) indicates no recruitment.
* `PR(Capture) Ratio (M/U)` is the ratio of the probability of capture of marked fish to the probability of capture of unmarkd fish for the second sample. Values greater than one indicate that marked fish are more likely to be captured than unmarked fish, whereas values less than one indicate that marked fish are less likely to be captured than unmarked fish. A value of one (the default) indicates that the probabilities of capture are the same between marked and unmarked fish.

Note that the title to the plot will describe the type of assumption violation (if any) being simulated. You also may need to make the plot pane larger to see the entire set of gear options.

Use `mrClosed1Sim()` to model assumption violations for each situation where you identified your expectations above. For each situation, identify whether the population estimate is an over, under, or unbiased estimate of the initial **AND** final population sizes and identify whether your expectations for the initial population size from above were met. [*Hint: I suggest organizing you results into a table that has three columns where the first column lists the sitution, the second column lists your result about the initial population size, and the third column list your results about the final population size.*]
