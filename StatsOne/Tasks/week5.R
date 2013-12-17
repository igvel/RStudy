#  Week 4 Task

library(gclus)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

salary <- read.table("Stats1.13.HW.05.txt", header = T)
View(salary)
describe(salary)

#1
model1 <- lm(salary$salary ~ salary$years)
summary(model1)
confint(model1)
#4930.12 6345.48

#2
model2 <- lm(salary$salary ~ salary$courses)
summary(model2)
confint(model2)
# 560.09 872.09

#3
model3 <- lm(salary$salary ~ salary$years + salary$courses)
summary(model3)
confint(model3)
anova(model1, model3)
anova(model2, model3)
# Bettern than both

#4
model3.z <- lm(scale(salary$salary) ~ scale(salary$years) + scale(salary$courses))
summary(model3.z)
confint(model3)
confint(model3.z)
# YES

#5
# sample

#6
set.seed(1)
salary.sample <- salary[sample(nrow(salary), 15), ]
cor(salary.sample[2:4])
cor(salary[2:4])
# Lower

#7
salary.subset <- salary[51:70, ]
model3.subset <- lm(salary.subset$salary ~ salary.subset$years + salary.subset$courses)
summary(model3.subset)
salary.subset$predicted <- fitted(model3.subset)
plot(salary.subset$salary ~ salary.subset$predicted)
abline(lm(salary.subset$salary ~ salary.subset$predicted))
# 85

#8
model1.subset <- lm(salary.subset$salary ~ salary.subset$years)
summary(model1.subset)
model2.subset <- lm(salary.subset$salary ~ salary.subset$courses)
summary(model2.subset)
model3.subset <- lm(salary.subset$salary ~ salary.subset$years + salary.subset$courses)
summary(model3.subset)
anova(model1.subset, model2.subset, model3.subset)
# model3

#9
salary.subset$predicted <- fitted(model3.subset)
cor(salary.subset)
# 0.92

#10
salary.subset$resid <- resid(model3.subset)
salary.subset$resid
cor(salary.subset)
model.e <- lm(salary.subset$predicted ~ salary.subset$resid)
summary(model.e)
anova(model.e)
plot(salary.subset$predicted ~ salary.subset$resid)
abline(model.e)
#No