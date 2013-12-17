# Manual computation example - Factorial ANOVA

# First we make our data set.
# We have two factors, A and B.
# A has levels a1, a2. B has levels b1, b2, b3. This is the 2 by 3 case.
# Each of the 6 "cells" will have 5 measurements, for a total of 30.
a1b1 <- c(3.8, 4.5, 7.3, 8.3, 6.1)
a1b2 <- c(14.8, 15.3, 9.3, 7.6, 8.0)
a1b3 <- c(15.5, 16.6, 19.5, 20.3, 18.1)
a2b1 <- c(7.8, 6.5, 9.3, 11.3, 10.1)
a2b2 <- c(13.8, 14.3, 18.3, 16.6, 17.0)
a2b3 <- c(26.5, 27.6, 21.5, 21.3, 28.1)
# Combine them into a data frame.
# We're going to do this in "long" form.
ex <- data.frame(id=1:30,
                 A=c(rep("a1",15),rep("a2",15)),
                 B=rep(c(rep("b1",5),rep("b2",5),rep("b3",5)),2),
                 value=c(a1b1,a1b2,a1b3,a2b1,a2b2,a2b3))
ex

# We are going to start by essentially doing a one-way ANOVA, where
# we consider that each of the 6 cells is a separate level, without
# thinking about that they come from 2 factors.

# First we will need the means for each of the 6 cells.
# The quickest way I could think of to put them in a new column was:
meanAB <- tapply(ex$value,list(ex$A,ex$B),mean)
ex$cellm <- diag(meanAB[ex$A,ex$B])
# And we want the grand mean in a column, too:
ex$grandm <- mean(ex$value)
ex

# Compute the "sum of squares" for the total data set.
# For this, the deviations are between the individual measurements
# and the grand mean.
ex$dev.total <- ex$value - ex$grandm
# Square them.
ex$sq.total <- ex$dev.total^2
ex
# And add.
SS.total <- sum(ex$sq.total)
SS.total
# As usual, we want the degrees of freedom.
# Here we have 30 independent measurements, but we lose 1 degree
# of freedom for the grand mean, so
df.total <- 29
# With that we can get the "mean sum of squares" for the total data set.
MS.total <- SS.total / df.total
MS.total

# Now we want the "sum of squares" within each cell.
# For this the deviations are between the individual measurements
# and the means for each cell.
ex$dev.within <- ex$value - ex$cellm
# Square them.
ex$sq.within <- ex$dev.within^2
ex
# Add.
SS.within <- sum(ex$sq.within)
SS.within
# Figure the degrees of freedom:
# We had 30 independent measurements, but here we lost 6 degrees
# of freedom for the 6 cell means, so
df.within <- 24
# Compute the mean sum of squares.
MS.within <- SS.within / df.within
MS.within

# Continuing on, we want the sum of squares between the cells.
# Here the deviations are between the means for the cells and
# the grand mean.
ex$dev.between <- ex$cellm - ex$grandm
# Square them.
ex$sq.between <- ex$dev.between^2
ex
# Add.
SS.between <- sum(ex$sq.between)
SS.between
# Figure the degrees of freedom.
# We had 6 cell means to work with, but we lost one degree of
# freedom for the grand mean, so
df.between <- 5
# Compute the mean sum of squares.
MS.between <- SS.between / df.between
MS.between

# And now we have finished the one-way ANOVA considering the 6 cells
# as independent of each other.
# As expected, the sums of squares add up:
SS.total
SS.within + SS.between
# And the degrees of freedom add up:
df.total
df.within + df.between

# The next part is now to address the fact that the six cells are
# related by being the result of two factors.
# We will partition the sum of squares between the cells into
# parts due to the factor A, the factor B and the interaction.
# Now we will need the means for each level of A and for each
# level of B.
meanA <- tapply(ex$value,ex$A,mean)
meanB <- tapply(ex$value,ex$B,mean)
# And put them in more columns.
ex$Am <- meanA[ex$A]
ex$Bm <- meanB[ex$B]
ex

# So here we go, with more familiar computations.
# For the sum of squares for the A contribution:
# The deviations are between the means for A and the grand mean.
ex$dev.A <- ex$Am - ex$grandm
# Square them.
ex$sq.A <- ex$dev.A^2
# Add.
SS.A <- sum(ex$sq.A)
SS.A
# Degrees of freedom.
# We have 2 means for A, since A has 2 levels, and we lose 1
# for the grand mean, so
df.A <- 1
# Mean squares.
MS.A <- SS.A / df.A
MS.A

# For the sum of squares for the B contribution:
# The deviations are between the means for B and the grand mean.
ex$dev.B <- ex$Bm - ex$grandm
# Square them.
ex$sq.B <- ex$dev.B^2
# Add.
SS.B <- sum(ex$sq.B)
SS.B
# Degrees of freedom.
# We have 3 means for B, since A has 3 levels, and we lose 1
# for the grand mean, so
df.B <- 2
# Mean squares.
MS.B <- SS.B / df.B
MS.B

# We're nearly done, but now we have to figure the interaction.
# Before we can do this, we need to compute what the value for
# each cell would be just based on the simple effects of A and
# B, without the interaction.  We are essentially doing a fit
# of the data to the simple effects.  So the fitted value for
# each of the 6 cells is going to be the grand mean + the effect
# of A + the effect of B.  We put them into yet another column.
ex$fit <- ex$grandm + (ex$Am - ex$grandm) + (ex$Bm - ex$grandm)
ex
# Obviously we could have simplified that, but the objective
# here is clarity, not efficiency.
# Now the deviations for interaction are the differences of
# the cell means from the fitted value of the simple effects only.
ex$dev.AxB <- ex$cellm - ex$fit
# Square them.
ex$sq.AxB <- ex$dev.AxB^2
# Add.
SS.AxB <- sum(ex$sq.AxB)
SS.AxB
# I can't really explain the value for the degrees of freedom
# in this case, but looking it up tells us that
df.AxB <- df.A * df.B
df.AxB
# With that, we get the mean sum of squares.
MS.AxB <- SS.AxB / df.AxB
MS.AxB

# The next thing to note is that we have partitioned SS.between:
SS.between
SS.A + SS.B + SS.AxB
# And also that the degrees of freedom add up.
df.between
df.A + df.B + df.AxB

# The last step in this computation is to determine the F-statistics.
# We have three of them: for the contribution from A, from B and
# from the interaction.  All of them are computed relative to
# the variance within the cells.
F.A <- MS.A / MS.within
F.B <- MS.B / MS.within
F.AxB <- MS.AxB / MS.within
# And from the F-statistics, we can get the p-values.
p.A <- pf(F.A, df.A, df.within, lower.tail = FALSE)
p.B <- pf(F.B, df.B, df.within, lower.tail = FALSE)
p.AxB <- pf(F.AxB, df.AxB, df.within, lower.tail = FALSE)

# Now we would like to verify that we got the same results that
# R computes when it does ANOVA.
# Create the ANOVA model.
aov.model <- aov(ex$value ~ ex$A * ex$B)
# Get the summary report.
summary(aov.model)

# Compare the values we got with the ones from R.
# The first row of the summary report is the A contribution, plus
# its F and p values.
# You see
data.frame(df.A, SS.A, MS.A, F.A, p.A)
# [We're just using data.frame as a convenient way to print.]
# The next row of the summary report is the B contribution, plus
# its F and p values.
data.frame(df.B, SS.B, MS.B, F.B, p.B)
# The third row of the summary report is the interaction, plus
# its F and p values.
data.frame(df.AxB, SS.AxB, MS.AxB, F.AxB, p.AxB)
# The last row of the summary report is the "within" data.
data.frame(df.within, SS.within, MS.within)