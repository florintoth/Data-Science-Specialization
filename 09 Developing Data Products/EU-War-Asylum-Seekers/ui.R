library(shiny)

migrantData <- read.csv("./data/migr_asyappctza_1_Data.csv", stringsAsFactors = F)

shinyUI(pageWithSidebar(
  headerPanel('Asylum Seekers in Europe from Major War-torn Countries'),
  sidebarPanel(
    selectInput('origin', 'Choose the citizenship country of the asylum applicant', choices = c(migrantData$CITIZEN,"ALL")),
    selectInput('host', 'Choose the European country where asylum was applied for', choices = migrantData$GEO)
  ),
  mainPanel(
    p('This shiny app will show you a chart of the number of asylum seeker applications over time in the chosen European countries'),
    h4('The chosen citizenship country of the asylum applicant:'),
    verbatimTextOutput('origin'),
    h4('The chosen European country where asylum was applied for:'),
    verbatimTextOutput('host'),
    h4('The chart of the number of asylum seeker applications in Europe between 2008 and 2014:'),
    plotOutput('g')
  )
))