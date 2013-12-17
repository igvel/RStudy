#  Week 7 Task

library(car)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

data <- read.table("Stats1.13.HW.08.txt", header = T)
describe(data)

data.pre <- subset(data, data$time == "pre")
data.post <- subset(data, data$time == "post")

#1 
t.test(data.post$SR, data.pre$SR, paired = T)
# Easier way
t.test(data$SR ~ data$time, paired=T)
# Yes

#2 - PE
wm.pre <- subset(data.pre, data.pre$condition == "WM")
wm.post <- subset(data.post, data.post$condition == "WM")
t.test(wm.post$SR, wm.pre$SR, paired = T)
cohensD(wm.post$SR, wm.pre$SR, method="paired")

pe.pre <- subset(data.pre, data.pre$condition == "PE")
pe.post <- subset(data.post, data.post$condition == "PE")
t.test(pe.post$SR, pe.pre$SR, paired = T)
cohensD(pe.post$SR, pe.pre$SR, method="paired")

ds.pre <- subset(data.pre, data.pre$condition == "DS")
ds.post <- subset(data.post, data.post$condition == "DS")
t.test(ds.post$SR, ds.pre$SR, paired = T)
cohensD(ds.post$SR, ds.pre$SR, method="paired")

#3 DS

#4
# Long way to reshape
names(data.pre)
library(plyr)
data.pre <- rename(data.pre, c("SR" = "pre"))
data.post <- rename(data.post, c("SR" = "post"))
data.pre$time <- NULL
data.post$time <- NULL
data.all <- merge(data.pre, data.post)

# short way to reshape to wide
library(reshape2)
data.wide <- cast(data, subject + condition ~ time)

data.all$gain <- data.all$post - data.all$pre


wm <- subset(data.all, data.all$condition == "WM")
pe <- subset(data.all, data.all$condition == "PE")
ds <- subset(data.all, data.all$condition == "DS")

t.test(wm$gain, pe$gain,  var.equal = T)
t.test(pe$gain, ds$gain,  var.equal = T)
t.test(ds$gain, wm$gain,  var.equal = T)
# None

#5
# First, check the homogeneity of variance assumption
leveneTest(data.all$gain, data.all$condition, center="mean")
leveneTest(data.all$gain, data.all$condition)
# No

#6
aov.model <- aov(data.all$gain ~ data.all$condition)
summary(aov.model)
# Yes

#7
library(lsr)
etaSquared(aov.model, anova = T)
# 0.34

#8 No

#9
TukeyHSD(aov.model)
# WM DS

#10 WM or DS
