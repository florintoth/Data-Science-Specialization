NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

NEISCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)

coalFind  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
USCoal <- NEISCC[coalFind, ]

USCoalTotalByYear <- aggregate(Emissions ~ year, USCoal, sum)

png("plot4.png")
g <- ggplot(USCoalTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('US Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()