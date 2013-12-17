#  Week 4 Task

library(gclus)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

salary <- read.table("Stats1.13.HW.06.txt", header = T)
View(salary)
describe(salary)

#1 2
model1 <- lm(salary$salary ~ salary$years)
summary(model1)
confint(model1)
# 5638
# 4930 6345

#3 4
model3 <- lm(salary$salary ~ salary$years + salary$courses)
summary(model3)
confint(model3)
# 4807
# 4140 5473

prof.code <- C(salary$profession, treatment)
prof.code
model4 <- lm(salary$salary ~ salary$years + salary$courses + prof.code)
summary(model4)
confint(model4)
#5 9204
#6 Yes
#7 15903
#8  Yes

salary$fitted <- fitted(model4)
plot(salary$salary ~ salary$fitted)
abline(lm(salary$salary ~ salary$fitted))
anova(model3, model4)

#9
means <- tapply(salary$salary, salary$profession, mean)
means["doctor"] - means["teacher"]
# 24611

#10
model5 <- lm(salary$salary ~ salary$years + prof.code)
summary(model5)

model6 <- lm(salary$salary ~ salary$courses + prof.code)
summary(model6)

anova(model3, model4)
