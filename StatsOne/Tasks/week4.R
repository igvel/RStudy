#  Week 4 Task

library(gclus)

# Prepare data
setwd("c:/IVEL/Dropbox/!Active/Study/Statistics/Tasks")
getwd()

salary <- read.table("Stats1.13.HW.04.txt", header = T)
View(salary)
describe(salary)

#1
round(cor(salary$salary, salary$years), 2)
#0.74

#2
round(cor(salary$salary, salary$courses), 2)
#0.54

#3
cor.test(salary$salary, salary$years)
model1 <- lm(salary$salary ~ salary$years)
summary(model1)
plot(salary$salary ~ salary$years)
abline(model1)
# R-Squared*100 55

#4
model2 <- lm(salary$salary ~ salary$courses)
summary(model2)
plot(salary$salary ~ salary$courses)
abline(model2)
# No

#5
model3 <- lm(salary$salary ~ salary$years + salary$courses)
summary(model3)
# R-Squared*100 65

#6-7
round(cor(salary[2:4]),2)
model1.z <- lm(scale(salary$salary) ~ scale(salary$years))
summary(model1.z)
model2.z <- lm(scale(salary$salary) ~ scale(salary$courses))
summary(model2.z)
model3.z <- lm(scale(salary$salary) ~ scale(salary$years) + scale(salary$courses))
summary(model3.z)
#0.74 0.54

#8
salary$predicted <- fitted(model3)
mean(salary$predicted)
plot(salary$salary ~ salary$predicted, main = "Scatterplot", ylab = "Salary", xlab = "Model 3 Predicted Scores")
abline(lm(salary$salary ~ salary$predicted), col="blue")
# 75426

#9
salary$e <- resid(model3)
mean(salary$e)
hist(salary$e)
plot(salary$predicted ~ salary$e, main = "Scatterplot", ylab = "Model 3 Predicted Scores", xlab = "Model 3 Residuals")
abline(lm(salary$predicted ~ salary$e), col="blue")
# 0 - mean error must be zero

#10
#Yes


