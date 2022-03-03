---
layout: page
title: Class Exercise I
subtitle: Stock-Recruitment
css: /css/modules.css
---

## Exploring Parameters
Both the Beverton-Holt and Ricker stock-recruitment curves have two parameters, a and b. These two parameters control the specific shape of each curve and dictate the peak level or recruitment, R<sub>p</sub>, and, potentially, the stock level at which that peak will occur, S<sub>p</sub>. In this exercise you will explore the relative effect of a and b on R<sub>p</sub> and S<sub>p</sub>, as well as the specific shape of the models.

The `srSim()` function in the `FSAsim` package can be used to create a graphic that shows the number of recruits (R) or the number of recruits per spawner (R/S) versus the number of spawners (S). This plot will have R<sub>p</sub> and, for the Ricker curve, S<sub>p</sub> labeled. A gear box allows you to choose values of a and b for each model to see how it affects the model curve, R<sub>p</sub>, and, possibly, S<sub>p</sub>. Use this function to answer the following questions. [*Note that no arguments to `srSim()` are needed to show the Beverton-Holt model, but you must include `type="Ricker"` to show the Ricker model.*]

1. How does changing a in the Beverton-Holt model effect R<sub>p</sub>?
1. How does changing B in the Beverton-Holt model effect R<sub>p</sub>?
1. How does changing a in the Ricker model effect R<sub>p</sub> and S<sub>p</sub>?
1. How does changing B in the Ricker model effect R<sub>p</sub> and S<sub>p</sub>?

&nbsp;

# Population Dynamics Over Time
For very simple populations, stock-recruitment models can be used to predict future population size. For example, imagine a salmon population where adults only spawn once and return to spawn after two years of life. In this simple population the number of spawners this year will beget the number of spawners two years into the future (i.e., these spawners recruits). So, it can be interesting to see what type of population dynamics over time may be predicted from a stock-recruit model with various parameter choices. You will explore these dynamics in this exercise.

The `srCobWeb()` function in the `FSAsims` package can be used to model temporal population dynamics of a population given a specific model and parameters. Use of this function will be explained by your instructor in class, but note that the following code would be used to simulate a Ricker model with a=5 and b=0.01 parameters.

```
srCobWeb(type="Ricker",a=5,b=0.01)
```

1. Please describe how the population dynamics for the Ricker model with b=0.01 change as a increases through the following options: 5, 7, 10, 13, 14, 15, 16, and 17. Starting with a=10 also include `N2ignore=20` in `srCobWeb()` to ignore the first 20 iterations of the model (this will make the dynamics easier to identify).
1. Please describe how the population dynamics for the Beverton-Holt model with b=0.01 change as a increases through the following options: 5, 15, and 25.

You will discuss your finding in class.
