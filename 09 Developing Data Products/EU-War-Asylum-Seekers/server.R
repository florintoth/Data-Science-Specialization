library(shiny)
library(ggplot2)

# Read and prepare the data
migrantData <- read.csv("./data/migr_asyappctza_1_Data.csv", stringsAsFactors = F)
migrantData$Value <- gsub(":","0", migrantData$Value)
migrantData$Value <- gsub(",","", migrantData$Value)
migrantData$Value <- as.numeric(migrantData$Value)
migrantData$TIME <- as.character(migrantData$TIME)

# Create a function for charting
migrantPlot <- function(origin, host) {
        if (origin=="ALL") {
                migrantOriginHost <- subset(migrantData, migrantData$GEO==host)
                g <- ggplot(data = migrantOriginHost, aes(x = TIME,y = Value, group=CITIZEN, color=CITIZEN))
                g <- g + geom_line(size=1) 
                g <- g + geom_point()
                
        } else {
                migrantOrigin <- subset(migrantData,migrantData$CITIZEN==origin)
                migrantOriginHost <- subset(migrantOrigin, migrantOrigin$GEO==host)
                g <- ggplot(data = migrantOriginHost, aes(x = TIME,y = Value, group=CITIZEN, color=CITIZEN))
                g <- g + geom_line(size=1) 
                g <- g + geom_point()
        }
        return(g)
}

# Pass the output to the server
shinyServer(
        function(input, output) {
                output$origin <- renderPrint({input$origin})
                output$host <- renderPrint({input$host})
                output$g <- renderPlot({migrantPlot(input$origin, input$host)})
        }
)