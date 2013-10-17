# Real world data
plot(countries$GDP, countries$Piracy)

# Correlation test between two data sets
cor.test(c­ountries$G­DP, count­ries$Pirac­y)
?cor.test
# Linear model that best represents all our data points 
#(with a certain degree of error). 
#The lm function takes a model formula, 
#which is represented by a response variable (piracy rate), 
#a tilde character (~), and a predictor variable (GDP). 
#(Note that the response variable comes first.)
line <- lm(co­untries$Pi­racy ~ count­ries$GDP) 
abline(line)

?abline

# GGPlot2
install.packages("ggplot2")
help(package = "ggplot2")
library(ggplot2)
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)
weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
qplot(weights, prices, color = types)


