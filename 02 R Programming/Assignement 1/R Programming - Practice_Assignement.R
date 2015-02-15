dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

files_full <- list.files("diet_data", full.names=TRUE)

dat <- data.frame()
for (i in 1:5) {
        dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)

median(dat$Weight, na.rm=TRUE)

dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

weightmedian <- function(directory, day) {
        files_list <- list.files(directory, full.names = TRUE) #creates a list of files
        dat <- data.frame() #creates an empty data frame
        for (i in 1:5) {
                # loops through the files, rbinding them together
                dat <- rbind(dat, read.csv(files_list[i]))
        }
        dat_subset <- dat[which(dat[, "Day"] == day), ] #subsets the rows that match the 'day' argument
        median(dat_subset[, "Weight"], na.rm = TRUE) #identifies the median weight
        # while stripping out the NAs
}

weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)

# Optimal

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

for (i in seq_along(files_full)) {
        tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

str(lapply(files_full, read.csv)) # does the same as above

str(tmp[[1]])
head(tmp[[1]][,"Day"])

output <- do.call(rbind, tmp)
str(output)

