#  Week 7 Task

library(multilevel)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

data <- read.table("Stats1.13.HW.07.txt", header = T)
describe(data)

cor(data)
# 1 - 0.19 
# 2 - 0.21
# 3 - 0.21

model1 <- lm(data$happy ~ data$extra)
summary(model1)
confint(model1)
#4 - 4
#6 - .07 .48
model2 <- lm(data$happy ~ data$extra + data$diverse)
summary(model2)
confint(model2)
#5 - 7
#7 - .02 .43

data.ALL <- sobel(data$extra, data$diverse, data$happy) 
data.ALL
# 8 - 0.05
# 9 - 1.88
# 10 - Partial mediation