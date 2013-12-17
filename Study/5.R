# Arrrays
x <- 1:16

# dimensions of array
dim(x) <- c(2, 8)

# Sub array
x[2, 4:5]

#Index matrices
x <- array(1:20, dim=c(4,5))
x
# index matrix
i <- array(c(1:3,3:1), dim=c(3,2))
i

# Extract elements X[1,3], X[2,2] and X[3,1] as a vector structure
x[i]
# Assign zeros to them
x[i] <- 0 
x

#  Using factors
blocks <- factor(c("bl1", "bl2", "bl3", "bl2"))
b <- length(levels(blocks))
vars <- factor(c("var1", "var2", "var3", "var1"))
v <- length(levels(vars))
n <- length(blocks)
Xb <- matrix(0, n, b)
Xv <- matrix(0, n, v)
Xb
Xv
ib <- cbind(1:n, blocks)
ib
iv <- cbind(1:n, vars)
iv
Xb[ib] <- 1
Xv[iv] <- 1
N <- crossprod(Xb, Xv)
N

# Same thing one-liner
# table() uses the cross-classifying factors to build a contingency table of 
# the counts at each combination of factor levels.
N <- table(blocks, vars)
N
a1 <- array(1:4, dim=c(2,2))
a1
a2 <- array(4:1, dim=c(2,2))
a2
# Element-by-element operation
a1*a2
# Outer product
aa = a1 %o% a2
outer(a1, a2, "*")

d <- outer(0:9, 0:9)
fr <- table(outer(d, d, "-"))
plot(as.numeric(names(fr)), fr, type="h", xlab="Determinant", ylab="Frequency")

# transposition
A = matrix(1:16, 4, 4)
B <- t(A)
# matrix multiplication
a1 %*% a2
# crossproduct t(a1) %*% a2
crossprod(a1, a2)
# diagonal of matrix as vector
diag(a1)
# diagonal matrix from vector
v <- 1:5
diag(v)
# identity matrix of 4 dimension!
diag(4)

# Linear equations b <- a %*% x. To find x call solve
solve(a1,1:2)

