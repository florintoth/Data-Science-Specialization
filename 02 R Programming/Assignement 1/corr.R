corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        files <- list.files(directory)
        filepaths <- paste(directory, "/", files, sep="")
        fset <- c(1:length(files))
        okset <- fset[complete(directory, fset)[,2] > threshold]
        result <- c()
        for (i in okset) {
                data <- read.csv(filepaths[i])
                bdata <- !is.na(data)
                tdata <- data[bdata[,1]&bdata[,2]&bdata[,3]&bdata[,4],]
                result <- cbind(result,cor(tdata[,2], tdata[,3]))
        }
        as.vector(result)
}