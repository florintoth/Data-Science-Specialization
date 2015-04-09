datatmp <- "./data/household_power_consumption.txt"
data <- read.table(datatmp, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SampleData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SampleData$Date, SampleData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SampleData$Global_active_power)
subMetering1 <- as.numeric(SampleData$Sub_metering_1)
subMetering2 <- as.numeric(SampleData$Sub_metering_2)
subMetering3 <- as.numeric(SampleData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()
