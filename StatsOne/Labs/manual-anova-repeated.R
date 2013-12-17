# Manual computation example - Repeated Measures ANOVA

# First we make our data set.  We have three measurements each
# taken on five subjects.
a1 <- c(3.8, 4.5, 5.3, 3.3, 1.6)
a2 <- c(4.8, 5.8, 4.3, 7.6, 8.0)
a3 <- c(5.5, 6.6, 4.5, 8.8, 8.1)
# Combine them into a data frame.
# We might do this with 5 rows for the subjects and 3 columns
# for the different measurements, but it will be more convenient
# to do this in "long" form as follows:
data <- data.frame(subject=rep(1:5,3),
                   cond=c(rep("a1",5),rep("a2",5),rep("a3",5)),
                   value=c(a1,a2,a3))
# Be sure to treat the subjects at categorical data.
data$subject <- factor(data$subject)
data

# Before we go any further we will compute the total
# sum of squares, SStotal.
# For SStotal, we find the deviations from the grand mean.
# Get the grand mean and put in a column.
data$grandm <- mean(data$value)
data
# Compute the deviations.
data$dev.total <- data$value - data$grandm
data
# Now square all the deviations.
data$sq.total <- data$dev.total^2
data
# Now sum is all up.
SStotal <- sum(data$sq.total)
SStotal
# While we're here, let's think about the associated degrees
# of freedom:
# We have 15 independent measurements, which would give us
# 15 degrees of freedom, but we use up 1 for the grand mean. So
df.total <- 14
# Now we can also compute the mean squares for the total.
MStotal <- SStotal / df.total
MStotal

# Let's move on to the sums of squares for the pieces.

# Recall that we're trying to determine if the three sets of
# measurements for a1, a2 and a3 were drawn from the same
# population (the null hypothesis).  We don't want to know
# about differences between subjects.  For example, if one subject
# always measures above the mean, or always measures below the
# mean, for all conditions, that's not what we care about.  In
# essence that's just as if we were measuring with a instrument
# with a systematic error.  So the first thing we're going to
# do is to work out how much of the spread in the data is
# due to the subject error.
# Compute the means for each subject and put in a new column:
sm <- tapply(data$value, data$subject, mean)
data$subjm <- rep(sm,3)
data
# The deviations are between the subject means and the grand mean.
data$dev.subj <- data$subjm - data$grandm
data
# Square them.
data$sq.subj <- data$dev.subj^2
data
# Sum them to get the sum of squares for the contribution from subjects.
SSsubj <- sum(data$sq.subj)
SSsubj
# Figure the degrees of freedom:  We had 5 measurements, one for
# each subject mean, but we used up 1 for the grand mean, so
df.subj <- 4
# And now get the mean squares.
MSsubj <- SSsubj / df.subj
MSsubj

# The difference between each subject's mean and the grand mean is
# the error we want to exclude.
# Now that we've tallyed up that piece, we will remove that
# contribution from the data by adjusting all the values to
# account for the systematic difference between the subjects.
# The systematic differences are in data$dev.subj, so
data$adj.value <- data$value - data$dev.subj
data

# Now we basically just do a between groups ANOVA for the
# adjusted values.
# We will need the means across conditions in a new column.
cm <- tapply(data$adj.value, data$cond, mean)
data$condm <- c(rep(cm[1],5), rep(cm[2],5), rep(cm[3],5))
data

# Next we will compute the sum of squares within the (adjusted) groups.
# For this we need to compute deviations of each (adjusted) measurement
# from the mean of the group its in.
data$dev.within <- data$adj.value - data$condm
data
# Now we square the deviations.
data$sq.within <- data$dev.within^2
data
# And add them up.
SSwithin <- sum(data$sq.within)
SSwithin
# For the associated degrees of freedom:
# This is the tricky one.  We had 15 measurements originally, but
# we're not taking the deviations of them, but rather of the adjusted
# values.  And when we figured the degrees of freedom above, we
# saw that the adjusted values lost 4 degrees of freedom (df.subj),
# so the adjusted values have just 11 degrees of freedom.  And then
# we use up another 3 for the group means, so
df.within <- 8  # I'm pretty sure this is right.
# Now the mean squares "within".
MSwithin <- SSwithin / df.within
MSwithin

# Lastly we compute the sum of squares between the groups.
# Again, we start with the deviations.
# But for this computation, the deviations are the differences
# between the group means and the grand mean.
data$dev.between <- data$condm - data$grandm
data
# Now we square them.
data$sq.between <- data$dev.between^2
data
# And add.
SSbetween <- sum(data$sq.between)
SSbetween
# Again for the degrees of freedom:
# Here we only have 3 measurements, the 3 group means, and we
# use up 1 for the grand mean. So
df.between <- 2
# Now the mean squares "between".
MSbetween <- SSbetween / df.between
MSbetween

# The first thing to note is that SStotal equals
# SSsubj + SSwithin + SSbetween.
SStotal
SSsubj + SSwithin + SSbetween
# And also that the degrees of freedom add up.
df.total
df.subj + df.within + df.between

# The last step in this computation is to determine the F-statistic.
# Note that this is for the adjusted data, after the subject error
# has been removed.
F <- MSbetween / MSwithin
F
# And from the F-statistic, we can get the p-value.
p <- pf(F, df.between, df.within, lower.tail = FALSE)
p

# Now we would like to verify that we got the same results that
# R computes when it does ANOVA.
# Create the ANOVA model for repeated measures.
aov.model <- aov(data$value ~ data$cond + Error(data$subject/data$cond))
# Get the summary report.
summary(aov.model)

# Compare the values we got with the ones from R.
# The first section has the error contribution from the subjects.
# In the one row, you see
c(df.subj, SSsubj, MSsubj)
# The next section has the data for the analysis with this error
# pulled out.
# The first row is the "between" data, plus the F and p values.
# You see
c(df.between, SSbetween, MSbetween, F, p)
# The second row of the summary report is the "within" data.
# You see
c(df.within, SSwithin, MSwithin)
