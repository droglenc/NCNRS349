---
layout: page
title: Assignment
subtitle: Foundational Models
css: /css/modules.css
---

## Exploring Exponential Growth
The code below can be used to model population abundance (number of animals) over time with an exponential model with varying values of r. Copy this code directly into an R script (do not edit it) and run it.

```
library(tidyverse)

make_Expo <- function(t,N0,r) {
  N <- NULL
  for (i in seq_along(r)) {
    tmp <- c(t[1],r[i],N0)
    N <- rbind(N,tmp)
    for (j in seq_along(t)[-1]) {
      tmp <- c(t[j],r[i],N[nrow(N),3]*(1+r[i]))
      N <- rbind(N,tmp)
    }
  }
  
  N <- data.frame(N) %>%
    rename(t=V1,r=V2,N=tmp) %>%
    mutate(r=factor(r))
  N
}
```

The following code can then be used to model population abundance at three values of r (assuming a starting abundance of N~0~=5).

```
NE <- make_Expo(t=0:20,N0=5,r=c(0.2,0.3,0.4))
```

Abundance over time for each value of r is then plotted with the code below.

```
ggplot(data=NE,mapping=aes(x=t,y=N,color=r)) +
  geom_line(size=1) +
  theme_bw()
```

Use these results to answer the following questions.

1. Describe the general shape of each model scenario results.
1. What is the effect of increasing r on the model scenario results.
1. How realistic is this model for most populations of organisms? Explain.

&nbsp;

## Logistic Growth Model
The code below can be used to model population abundance (number of animals) over time with a logistic model with varying values of r and K. Copy this code directly into an R script (do not edit it) and run it.

```
make_Logistic <- function(t,N0,r,K) {
  N <- NULL
  for (i in seq_along(r)) {
    for (j in seq_along(K)) {
      tmp <- c(t[1],r[i],K[j],N0)
      N <- rbind(N,tmp)
      for (k in seq_along(t)[-1]) {
        NN <- N[nrow(N),4]
        tmp <- c(t[k],r[i],K[j],NN+NN*r[i]*(1-NN/K[j]))
        N <- rbind(N,tmp)
      }
    }
  }
  
  N <- data.frame(N) %>%
    rename(t=V1,r=V2,K=V3,N=tmp) %>%
    mutate(r=factor(r),K=factor(K))
  N
}
```

The following code can then be used to model population abundance at three values of r and three values of K (assuming a starting abundance of N~0~=5).

```
NL <- make_Logistic(t=0:20,N0=5,r=c(0.2,0.3,0.4),K=c(25,50,100))
```

Abundance over time for each value of r and K is then plotted with the code below.

```
ggplot(data=NL,mapping=aes(x=t,y=N,color=r,linetype=K)) +
  geom_line(size=1) +
  theme_bw()
```

Use these results to answer the following questions.

1. Describe the general shape of each model scenario results.
1. What is the effect of increasing K on the model scenario results.
1. What is the effect of increasing r on the model scenario results.
1. How realistic is this model for most populations of organisms? Explain.
