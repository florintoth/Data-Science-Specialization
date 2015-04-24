NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

library(ggplot2)

MotorBaltimore <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

MotorBaltimoreTotalByYear <- aggregate(Emissions ~ year, MotorBaltimore, sum)

png("plot5.png")
g <- ggplot(MotorBaltimoreTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from Motor Vehicle in Baltimore City from 1999 to 2008')
print(g)
dev.off()