#  Week 10 Task

library(psych)
library(aod)
library(QuantPsyc)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

data <- read.table("Stats1.13.HW.10.txt", header = T)
# 1
describeBy(data, data$change)
# MEAN median population - 35.78

# 2
lrfit <- glm(data$change ~ data$age + data$educ + data$gdp + data$co2, family = binomial)
summary(lrfit)
# educ and age

# 3
# all above

# 4 5
confint(lrfit) # CIs using profiled log-likelihood (default for logistic models)
confint.default(lrfit) # CIs using standard errors
# -31.17 -3.03
# 0.09 0.65

# 6,7,8
# Model fit
with(lrfit, null.deviance - deviance) #difference in deviance for the two models (chi-squared values)
with(lrfit, df.null - df.residual) #df for the difference between the two models
with(lrfit, pchisq(null.deviance-deviance, df.null-df.residual, lower.tail = FALSE)) #p-value
# 16.30
# 4
# Yes

# 9 
wald.test(b = coef(lrfit), Sigma = vcov(lrfit), Terms = 3) #educ
# Yes

# 10
ClassLog(lrfit, data$change)
# 81


# Significant predictors (danger, rehab, gendet)
par(mfrow=c(1,2))
plot(data$age, predict(lrfit), bty="n")
abline(lm(predict(lrfit) ~ data$age), col="blue", lwd=5)
plot(data$educ, predict(lrfit), bty="n")
abline(lm(predict(lrfit) ~ data$educ), col="blue", lwd=5)
par(mfrow=c(1,1))
title("Significant predictors")



