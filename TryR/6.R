# Data frames
chests <- c('gold', 'silver', 'gems', 'gold', 'gems')
types <- factor(chests)
weights <- c(300, 200, 100, 250, 150)
prices <- c(9000, 5000, 12000, 7500, 18000)

# construct data frame from vectors and factors
treasure <- data.frame(weights, prices, types)
# Get column of data by number
treasure[[2]]
# by name
treasure[["weights"]]
# by name - option 2
treasure$prices

# Load data frame from CSV
read.csv("targets.csv")

# Load data from text file with separators and header row
read.table("infantry.txt", sep="\t", header=TRUE)

# Merging data frames by same data in columns of the same name
targets <- read.csv("targets.csv")
infantry <- read.table("infantry.txt", sep="\t", header=TRUE)
merge(x = targe­ts, y = infan­try)
