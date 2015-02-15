pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        files <- list.files(directory)
        filepaths <- paste(directory, "/", files, sep="")
        init <- if (pollutant == "sulfate") {
                2
        } else {
                3
        }
        tdata <- matrix(NA,0,4)
        for (i in id) {
                data <- read.csv(filepaths[i])
                tdata <- rbind(tdata, data)
        }
        mean(tdata[,init], na.rm=TRUE)
}