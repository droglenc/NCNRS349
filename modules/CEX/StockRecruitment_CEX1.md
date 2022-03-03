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
