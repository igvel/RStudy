#  Week 3 Task

library(gclus)

# Prepare data
setwd("c:/IVEL/Dropbox/!Active/Study/Statistics/Tasks")
getwd()

sports <- read.table("Stats1.13.HW.03.txt", header = T)
sports
describe(sports)

#1
round(cor(sports$S1.pre, sports$S2.pre), 2)

#2
round(cor(sports$V1.pre, sports$V2.pre), 2)

#3
round(cor(sports[3:10]), 2)
#Both

#4
aer <- subset(sports, cond=="aer")
aer
des <- subset(sports, cond=="des")
des
round(cor(aer[3:10]), 2)
#V2

#5
sports$S1.improv <- (sports$S1.post - sports$S1.pre)
sports$S2.improv <- sports$S2.post - sports$S2.pre
sports$S.improv <- (sports$S1.improv + sports$S2.improv) / 2
cor(sports$S2.improv, sports$S2.pre)

des$S1.improv <- (des$S1.post - des$S1.pre)
des$S2.improv <- des$S2.post - des$S2.pre
des$S.improv <- (des$S1.improv + des$S2.improv) / 2
cor(des$S2.pre, des$S2.improv)

#6
sports$V1.improv <- (sports$V1.post - sports$V1.pre)
sports$V2.improv <- sports$V2.post - sports$V2.pre
sports$V.improv <- (sports$V1.improv + sports$V2.improv) / 2
cor(sports$V2.improv, sports$V2.pre)

des$V1.improv <- (des$V1.post - des$V1.pre)
des$V2.improv <- (des$V2.post - des$V2.pre)
des$V.improv <- (des$V1.improv + des$V2.improv) / 2
cor(des$V2.pre, des$V2.improv)

#7
des$S1.improv <- (des$S1.post - des$S1.pre)
des$S2.improv <- des$S2.post - des$S2.pre
des$S.improv <- (des$S1.improv + des$S2.improv) / 2
mean(des$S.improv)
sd(des$S.improv)

aer$S1.improv <- (aer$S1.post - aer$S1.pre)
aer$S2.improv <- aer$S2.post - aer$S2.pre
aer$S.improv <- (aer$S1.improv + aer$S2.improv) / 2
mean(aer$S.improv)
sd(aer$S.improv)

#8
pre <- data.frame(sports[3:4],sports[7:8])
pre.r <- abs(cor(pre))
pre.color <- dmat.color(pre.r)
pre.order <- order.single(pre.r)
round(cor(pre), 2)
describe(pre)
cpairs(pre, pre.order, panel.colors = pre.color, gap = .5, main = "Pre test correlation")

#9
post <- data.frame(sports[5:6],sports[9:10])
post.r <- abs(cor(post))
post.color <- dmat.color(post.r)
post.order <- order.single(post.r)
round(cor(post), 2)
describe(post)
cpairs(post, post.order, panel.colors = post.color, gap = .5, main = "Post test correlation")



