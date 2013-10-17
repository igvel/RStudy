# Vectors
c('a', 'b', 'c')

# Range
5:9

# Sequence with step
seq(5,9, 0.5)

# Access vectors
# Elements 1, 3
sentence[c(1,3)]
# elements 2-4
sentence[2:4]
# Assign range
sentence[5:7] <- c('the', 'poop', 'deck')

# Vector names
ranks <- 4:6
names(ranks) <- c("first", "second", "third")
ranks["first"]

# Plotting vector
vesselsSunk <- c(4, 5, 1)
names(vesselsSunk) <- c("England", "France", "Norway")
barplot(vesselsSunk)

# Vector math
a <- c(1, 2, 3)
# add scalar to each item
a + 1 
a / 2 
# add vector
b <- c(4, 5, 6)
a + b
# Compare vectors value by value - returns vector of booleans
a == c(1, 99, 3)
a < b
# Functions
sin(a)

# Scatter plot
x <- seq(1, 20, 0.1)
y <- sin(x)
plot(x, y)

# NA values
a <- c(1, 3, NA, 7, 9)
sum(a)
# Result = NA
sum(a, na.rm­ = TRUE)­ 
# Result = 20

