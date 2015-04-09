datatmp <- "./data/household_power_consumption.txt"
data <- read.table(datatmp, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SampleData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(SampleData$Date, SampleData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SampleData$Global_active_power)
subMetering1 <- as.numeric(SampleData$Sub_metering_1)
subMetering2 <- as.numeric(SampleData$Sub_metering_2)
subMetering3 <- as.numeric(SampleData$Sub_metering_3)
globalReactivePower <- as.numeric(SampleData$Global_reactive_power)
voltage <- as.numeric(SampleData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
