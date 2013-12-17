# Manual computation example - One-way between groups ANOVA

# First we make our data set.  We have three groups: a1, a2, a3,
# and 5 measurements in each group.
a1 <- c(3.8, 4.5, 5.3, 3.3, 1.6)
a2 <- c(4.8, 5.8, 4.3, 7.6, 8.0)
a3 <- c(5.5, 6.6, 4.5, 8.8, 8.1)

# Combine them into a data frame.
data <- data.frame(a1, a2, a3)
data

# We will need the means for each group and the grand mean.
m1 <- mean(a1)
m2 <- mean(a2)
m3 <- mean(a3)
grandm <- mean(c(a1,a2,a3))  # mean of all of them lumped together

# First we will compute the total sum of squares, SStotal.
# Start by computing the deviations.
# For SStotal, we find the deviations from the grand mean.
dev.total <- data - grandm
dev.total
# Now square all the deviations.
sq.total <- dev.total^2
sq.total
# Now sum is all up.
SStotal <- sum(sq.total)
SStotal
# While we're here, let's think about the associated degrees
# of freedom:
# We have 15 independent measurements, which would give us
# 15 degrees of freedom, but we use up 1 for the grand mean. So
df.total <- 14
# Now we can also compute the mean squares for the total.
MStotal <- SStotal / df.total

# Next we will compute the sum of squares within the groups.
# For this we need to compute deviations of each measurement
# from the mean of the group its in.
# To aid us, we will create a matrix the same shape as the data
# frame, filled with the group means:
groupm <- cbind(rep(m1,5), rep(m2,5), rep(m3,5))
groupm
# Now we can compute deviations we need for SSwithin by subtracting.
dev.within <- data - groupm
dev.within
# Now we square the deviations.
sq.within <- dev.within^2
sq.within
# And add them up.
SSwithin <- sum(sq.within)
SSwithin
# For the associated degrees of freedom:
# We have 15 independent measurements, but here we use up 3
# degrees of freedom for the 3 group means. So
df.within <- 12
# Now the mean squares "within".
MSwithin <- SSwithin/df.within

# Lastly we compute the sum of squares between the groups.
# Again, we start with the deviations.
# But for this computation, the deviations are the differences
# between the group means and the grand mean.
# We already made a matrix of the group means, so we can get
# the deviations we need by subtracting as follows:
dev.between <- groupm - grandm
dev.between
# Now we square them.
sq.between <- dev.between^2
sq.between
# And add.
SSbetween <- sum(sq.between)
# Again for the degrees of freedom:
# Here we only have 3 measurements, the 3 group means, and we
# use up 1 for the grand mean. So
df.between <- 2
# Now the mean squares "between".
MSbetween <- SSbetween / df.between

# The first thing to note is that SStotal equals SSwithin + SSbetween.
SStotal
SSwithin + SSbetween
# And also that the degrees of freedom add up.
df.total
df.within + df.between

# The last step in this computation is to determine the F-statistic.
F <- MSbetween / MSwithin
F

# Now we would like to verify that we got the same results that
# R computes when it does ANOVA.
# First we need to get the data into the right form for processing.
# We will use the "melt" function from the reshape package.
library(reshape)
data.long <- melt(data)
data.long
# Create the ANOVA model.
aov.model <- aov(data.long$value ~ data.long$variable)
# Get the summary report.
summary(aov.model)

# Compare the values we got with the ones from R.
# The first row of the summary report is the "between" data.
# You see
c(df.between, SSbetween, MSbetween, F)
# (We didn't compute the p-value.)
# The second row of the summary report is the "within" data.
# You see
c(df.within, SSwithin, MSwithin)
