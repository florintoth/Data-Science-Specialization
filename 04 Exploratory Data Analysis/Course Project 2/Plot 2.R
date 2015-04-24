NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

Baltimore  <- NEI[NEI$fips=="24510", ]

BaltimoreTotalByYear <- aggregate(Emissions ~ year, Baltimore, sum)

png("plot2.png")
barplot(height=BaltimoreTotalByYear$Emissions, names.arg=BaltimoreTotalByYear$year, 
        xlab="Year", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' Emissions in Baltimore City by Year'))
dev.off()