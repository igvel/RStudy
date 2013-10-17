# Matrices
# zeroed 3x4 matrix
matrix(0, 3, 4)

# matrix init with vector
matrix(1:12, 3, 4)

# vector reshaped as matrix
plank <- 1:8
dim(plank) <- c(2,4)

print(plank)
# Access items
plank[2,3]
# The row
plank[2,]
# Column
plank[,3]
# Range of columns
plank[, 2:4]

# Plotting
elevation <- matrix(1, 10, 10)
elevation[4, 6] <- 0
contour(elevation)
persp(elevation)
# scale
persp(elevation, expand=0.2)

# sample
contour(volcano)
persp(volcano, expand=0.2)
image(volcano)