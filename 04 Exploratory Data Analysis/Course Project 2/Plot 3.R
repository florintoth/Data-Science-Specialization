NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

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