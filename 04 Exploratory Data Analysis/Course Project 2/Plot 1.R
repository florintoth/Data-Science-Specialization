NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")
barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Year", 
        ylab=expression('Total PM'[2.5]*' Emission'),
        main=expression('Total PM'[2.5]*' Emissions by Year'))
dev.off()