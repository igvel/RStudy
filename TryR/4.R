# Summary

# Mean
limbs <- c(4, 3, 4, 3, 2, 4, 4, 4)
names(limbs) <- c('One-Eye', 'Peg-Leg', 'Smitty', 'Hook', 'Scooter', 'Dan', 'Mikey', 'Blackbeard')
mean(limbs)

barplot(limbs)
abline(h = mean(limbs))

# Median
median(limbs)

# SD
pounds <- c(45000, 50000, 35000, 40000, 35000, 45000, 10000, 15000)
barplot(pounds)
meanValue <- mean(pounds)
abline(h = mean(pounds))
deviation <- sd(pounds)
abline(h = meanValue + deviation)
abline(h = meanValue - deviation)