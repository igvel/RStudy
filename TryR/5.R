# Factors
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
# convert to factors
types <- factor(chests)
types
# integer values of factors
as.integer(types)
?as.integer
# output levels
levels(types)

#Plot
# 1 Normal
weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)
plot(weights, prices)

# 2 With factors
plot(weights, prices, pch=as.integer(types)) 
# Hard-coded legend
legend("topright", c("gems", "gold", "silver"), pch=1:3) 
# Derive legend from levels
legend("topright", levels(types), pch=1:length(levels(types)))
?plot
