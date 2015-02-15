dataset_url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(dataset_url, "specdata.zip")
unzip("specdata.zip", exdir = "specdata")

# pollutantmean("specdata", "sulfate", 1:10)

files_full <- list.files("specdata", full.names=TRUE)
summary(files_full)

dataset <- vector(mode = "list", length = length(files_full))
summary(dataset)

for (i in seq_along(files_full)) {
        dataset[[i]] <- read.csv(files_full[[i]])
}

str(dataset)

output <- do.call(rbind, dataset)
str(output)

pollutantmean <- function(directory, pollutant, id = 1:332){
        output_subset1 <- output[which(output[, "ID"] >= id[1]), ]
        output_subset2 <- output_subset1[which(output_subset1[, "ID"] <= 11, ]
        mean(output_subset2[ ,"pollutant"], na.rm = TRUE)
}

files <- list.files("specdata")
filepaths <- paste("specdata", "/", files, sep="")
fset <- c(1:length(files))
okset <- fset[complete("specdata", fset)[,"nobs"] > 150]
result <- c()
for (i in okset) {
        data <- read.csv(filepaths[i])
        bdata <- !is.na(data)
        tdata <- data[bdata[,1]&bdata[,2]&bdata[,3]&bdata[,4],]
        result <- cbind(result,cor(tdata[,2], tdata[,3]))
}
as.vector(result)