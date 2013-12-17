# Objects
# mode(object) - return mode of object
# length(object) - return length of object
a <- c(1,2)
mode(a)
# empty numeric vector
b <- numeric()
mode(b)

length(a)
length(b)

# list
l <- list(1, "a", list(2, "b"))
mode(l)
length(l)

x <- 3
mode(x)
length(x)

# mode change
d <- as.character(a)
e <- as.numeric(d)

# Length change- new empty values are NA
b[3] <- 3
length(b)
length(b) <- 5
b <- b[2:3]

# Get/set attributes
z <- 1:6
attr(z, "dim")
attr(z, "dim") <- c(2,3)
attr(z, "dim") <- NULL
z

# Object class
class(z)
class(l)
class(a)
df <- data.frame(a, b)
class(df)