outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
# You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])
str(outcome)

unique()
which.min()
order()
sort.list() # the same as order(), using only one argument.