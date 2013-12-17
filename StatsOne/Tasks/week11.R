#  Week 11 Task

library(car)
library(lsr)

# Prepare data
setwd(paste(getwd(), "/Tasks", sep=""))
getwd()

data <- read.table("Stats1.13.HW.11.txt", header = T)
describe(data)

data.fixed <- subset(data, data$cond == "fixed")
data.mall <- subset(data, data$cond == "malleable")

#1 
t.test(data.fixed$verbal.pre, data.fixed$verbal.post, paired = T)
# Yes

# 2
t.test(data.fixed$spatial.pre, data.fixed$spatial.post, paired = T)
# df = 49?

# 3
wilcox.test(data.fixed$spatial.pre, data.fixed$spatial.post, paired = T)
# Wilcoxon

# 4
t.test(data.mall$spatial.pre, data.mall$spatial.post, paired = T)
cohensD(data.mall$spatial.pre, data.mall$spatial.post, method = "paired")
# 0.45
cohensD(data.fixed$spatial.pre, data.fixed$spatial.post, method = "paired")
# 0.55

# 5
cohensD(data.fixed$verbal.pre, data.fixed$verbal.post, method = "paired")
cohensD(data.fixed$spatial.pre, data.fixed$spatial.post, method = "paired")
cohensD(data.fixed$intel.pre, data.fixed$intel.post, method = "paired")
# Verbal

# 6
cohensD(data.mall$verbal.pre, data.mall$verbal.post, method = "paired")
cohensD(data.mall$spatial.pre, data.mall$spatial.post, method = "paired")
cohensD(data.mall$intel.pre, data.mall$intel.post, method = "paired")
# Verbal

# 7
wilcox.test(data$verbal.pre, data$spatial.pre, paired = F)
wilcox.test(data$verbal.pre, data$intel.pre, paired = F)
wilcox.test(data$intel.pre, data$spatial.pre, paired = F)
# All

# 8
pre.m = data.mall$verbal.pre + data.mall$spatial.pre + data.mall$intel.pre 
post.m = data.mall$verbal.post + data.mall$spatial.post + data.mall$intel.post 
cohensD(pre.m, post.m, method="paired") 
pre.f = data.fixed$verbal.pre + data.fixed$spatial.pre + data.fixed$intel.pre 
post.f = data.fixed$verbal.post + data.fixed$spatial.post + data.fixed$intel.post
cohensD(pre.f, post.f, method="paired")
# Mallable

# 9
#Also use Cohen's D as in 5 and 6
# Verbal


# 10
data$verbal.gain <- data$verbal.post - data$verbal.pre
data$spatial.gain <- data$spatial.post - data$spatial.pre
data$intel.gain <- data$intel.post - data$intel.pre

wilcox.test(data$verbal.gain  ~ data$cond, paired = F)
wilcox.test(data$spatial.gain  ~ data$cond, paired = F)
wilcox.test(data$intel.gain  ~ data$cond, paired = F)

# It depends on ability - significant only on verbal

