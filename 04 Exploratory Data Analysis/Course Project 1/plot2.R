datatmp <- "./data/household_power_consumption.txt"
data <- read.table(datatmp, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SampleData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SampleData$Date, SampleData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SampleData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
