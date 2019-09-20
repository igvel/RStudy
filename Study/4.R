# Factors
state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",  "wa",  "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa",  "tas",
           "sa",  "nt",  "wa",  "vic", "qld", "nsw", "nsw", "wa",
           "sa",  "act", "nsw", "vic", "vic", "act")

statef <- factor(state)
statef
levels(statef)

incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)

# tapply - applies functions by grouping values by levels
# E.g. mean incomes grouped by state
incmeans <- tapply(incomes, statef, mean)
incmeans

stderr <- function(x) sqrt(var(x)/length(x))
incster <- tapply(incomes, statef, stderr)
incster
inclen <- tapply(incomes, statef, length)
inclen
# Ordered factor
stateord <- ordered(state)
stateord

# table of frequences (vector in this case)
statefr <- table(statef)
statefr

# Cut incomes into classes using cut
factor(cut(incomes, breaks = 35+10*(0:7))) -> incomef
table(incomef, statef)
