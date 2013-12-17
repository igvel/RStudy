#  Week 9 Task

library(car)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

data <- read.table("Stats1.13.HW.09.txt", header = T)
describe(data)

names(data)
# 1
class(data$Haste)
# integer

# 2
data$Prime <- factor(data$Prime)
data$Haste <- factor(data$Haste)

data.aov <- aov(data$Helping ~ data$Prime*data$Haste)
summary(data.aov)
# Yes
# 3 - Yes
# 4 - Yes

# 5 - No
TukeyHSD(data.aov)

# 6 - 0.40
etaSquared(data.aov, anova = T)

# 7 - 0.18

#8 - Early
data.early <- subset(data, data$Haste == "1")
data.ontime <- subset(data, data$Haste == "2")
data.late <- subset(data, data$Haste == "3")

data.early.aov <- aov(data.early$Helping ~ data.early$Prime)
summary(data.early.aov)
etaSquared(data.early.aov)
TukeyHSD(data.early.aov)

data.ontime.aov <- aov(data.ontime$Helping ~ data.ontime$Prime)
summary(data.ontime.aov)
etaSquared(data.ontime.aov)
TukeyHSD(data.ontime.aov)

data.late.aov <- aov(data.late$Helping ~ data.late$Prime)
summary(data.late.aov)
etaSquared(data.late.aov)
TukeyHSD(data.late.aov)
#9 - 0.59
#10 - 4