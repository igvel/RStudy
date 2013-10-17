#  Week 2 Task

# Prepare data
setwd("c:/IVEL/Dropbox/!Active/Study/Statistics/Tasks")
getwd()

sports <- read.table("Stats1.13.HW.02.txt", header = T)

#1
nrow(sports)

#2
names(sports)

# 3-4
describe(sports)

mean(sports$SR)
var(sports$SR)

# 5,6,7
pretest <- subset(sports, time=="pre")
pretest
posttest <- subset(sports, time=="post")
posttest

mean(pretest$SR)
sd(posttest$SR)
median(posttest$SR)

# 8
wmpost <- subset(posttest, condition=="WM")
pepost <- subset(posttest, condition=="PE")
dspost <- subset(posttest, condition=="DS")

mean(wmpost$SR)
mean(pepost$SR)
mean(dspost$SR)

# 9
wmpre <- subset(pretest, condition=="WM")
wmpre
pepre <- subset(pretest, condition=="PE")
pepre
dspre <- subset(pretest, condition=="DS")
dspre

par(mfrow = c(2,6))
hist(wmpre[, 4], xlab = "WM Pre", main = "") 
plot(density(wmpre[, 4]), xlab = "WM Pre", main = "") 
hist(pepre[, 4], xlab = "PE Pre", main = "") 
plot(density(pepre[, 4]), xlab = "PE Pre", main = "") 
hist(dspre[, 4], xlab = "DS Pre", main = "") 
plot(density(dspre[, 4]), xlab = "DS Pre", main = "") 
hist(wmpost[, 4], xlab = "WM Post", main = "") 
plot(density(wmpost[, 4]), xlab = "WM Post", main = "") 
hist(pepost[, 4], xlab = "PE Post", main = "") 
plot(density(pepost[, 4]), xlab = "PE Post", main = "") 
hist(dspost[, 4], xlab = "DS Post", main = "") 
plot(density(dspost[, 4]), xlab = "DS Post", main = "") 
?density
# 10

wm <- subset(sports, condition=="WM")
wm
pe <- subset(sports, condition=="PE")
pe
ds <- subset(sports, condition=="DS")
ds

par(mfrow = c(3,1))
sm.density.compare(wm$SR, wm$time, xlab = "WM")               
sm.density.compare(pe$SR, pe$time, xlab = "PE")               
sm.density.compare(ds$SR, ds$time, xlab = "DS")               


# Alternate way 
comatrix <- matrix(sports$SR, 16, 6)
codata <- data.frame(comatrix)
names(codata) <- c("WMpre", "PEpre", "DSpre", "WMpost", "PEpost", "DSpost")
multi.hist(codata)

