# Coursera Exploratory Data Analysis - Course Project 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

# Plot 1

totalPM25ByYear <- tapply(NEI$Emissions, NEI$year, sum) # or
TotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png")
plot(names(totalPM25ByYear), totalPM25ByYear, type="l",
     xlab="Year", ylab=expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
     main=expression("Total US" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()

png("plot1.png")
barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="years", 
        ylab=expression('total PM'[2.5]*' Emission'),
        main=expression('Total PM'[2.5]*' Emissions by Year'))
dev.off()

# Plot 2

Baltimore  <- NEI[NEI$fips=="24510", ]

BaltimoreTotalByYear <- aggregate(Emissions ~ year, Baltimore, sum)

png("plot1.png")
barplot(height=BaltimoreTotalByYear$Emissions, names.arg=BaltimoreTotalByYear$year, 
        xlab="Years", ylab=expression('Total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in Baltimore City, MD Emissions by Year'))
dev.off()

# Plot 3

library(ggplot2)
Baltimore  <- NEI[NEI$fips=="24510", ]
TotalByYearAndType <- aggregate(Emissions ~ year + type, Baltimore, sum)

png("plot3.png")
g <- ggplot(TotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in Baltimore City from 1999 to 2008')
print(g)
dev.off()

# Plot 4

NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

coalFind  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
USCoal <- NEISCC[coalFind, ]

USCoalTotalByYear <- aggregate(Emissions ~ year, USCoal, sum)

png("plot4.png")
g <- ggplot(USCoalTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('US Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()

# Plot 5

MotorBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

MotorBaltimoreTotalByYear <- aggregate(Emissions ~ year, MotorBaltimore, sum)

png("plot5.png")
g <- ggplot(MotorBaltimoreTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from Motor Vehicle in Baltimore City from 1999 to 2008')
print(g)
dev.off()

# Plot 6

BaltimoreLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

BaltimoreLATotalByYearAndFips <- aggregate(Emissions ~ year + fips, BaltimoreLA, sum)
BaltimoreLATotalByYearAndFips$fips[BaltimoreLATotalByYearAndFips$fips=="24510"] <- "Baltimore"
BaltimoreLATotalByYearAndFips$fips[BaltimoreLATotalByYearAndFips$fips=="06037"] <- "Los Angeles"

png("plot6.png")
g <- ggplot(BaltimoreLATotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from Motor Vehicle in Baltimore City vs Los Angeles')
print(g)
dev.off()