# Methods of assignments
x <- c(1, 2, 3)
c(3, 2, 1) -> y
assign("z", c(x, 0, y))

sort(z)
sum(x)
prod(x)

# Parallel max and min
pmax(x, y)
pmin(x, y)

# Complex numbers
sqrt(17 + 10i)

# sequence
seq(-5, 5, .2)

# Replication - the whole
rep(x, times=3)
# Element-by-element
rep(x, each=3)

# NA values - not available
a <- c(1:3, NA)
ind <- is.na(a)

# NaN values
0/0
# True
is.na(0/0)
# True
is.nan(0/0)
# False
is.nan(NA)

# Boolean values
b <- x < 2

# Characters
s <- c("A", "B", "C")
s
# Concatenates objects into strings
paste("Hello", c("world","space"))
labs <- paste(c("X","Y"), 1:10, sep="")

# Vector subsets
# Indexes can contain 
# Simple numbers
x[1]
# 1. Logical vector of the same length
(a+1)[(!is.na(a)) & a>0] -> aa
aa
# 2. Positive integral index
x[1:10]
# Can even repeat the same indexes
c("x","y")[rep(c(1,2,2,1), times=4)]
# 3. Negative integral index - excluded indexes
z[-(2:4)]
# 4. Vector of strings (only if names are defined)
fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange", "banana", "apple", "peach")
lunch <- fruit[c("apple","orange")]

# Modification of elements is possible
a[is.na(a)] <- 0
a[a == 0] <- NA
