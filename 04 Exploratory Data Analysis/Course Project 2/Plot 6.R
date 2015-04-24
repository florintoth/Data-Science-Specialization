NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

library(ggplot2)

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