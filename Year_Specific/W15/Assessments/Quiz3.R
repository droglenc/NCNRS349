library(NCStats)
intercept <- -1.
beta <- 1
n <- 200
xtest <- rnorm(n,1,1)
linpred <- intercept + (xtest * beta)
prob <- exp(linpred)/(1 + exp(linpred))
runis <- runif(n,0,1)
df <- data.frame(presence=as.factor(ifelse(runis < prob,"yes","no")),distance=round(xtest+abs(min(xtest))+0.1,1))

str(df)
glm1 <- glm(presence~distance,data=df,family=binomial)
fitPlot(glm1,breaks=seq(0,7,0.25),xlab="Distance from Road",ylab="Presence")
summary(glm1)
