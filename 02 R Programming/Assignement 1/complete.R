complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        files <- list.files(directory)
        filepaths <- paste(directory, "/", files, sep="")
        result <- matrix(NA,0,2)
        for (i in id) {
                data <- read.csv(filepaths[i])
                bdata <- !is.na(data)
                sres <- c(i, nrow(data[bdata[,1]&bdata[,2]&bdata[,3]&bdata[,4],]))
                result <- rbind(result, sres)
        }
        colnames(result)=c("id", "nobs")
        rownames(result)=id
        result <- as.data.frame(result)
        result
}