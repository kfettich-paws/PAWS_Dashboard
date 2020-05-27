#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(gsheet)

# import dataset

df <- read.csv("WFHReport.csv")

timeTrends <- function(df){
  
}

ui <- dashboardPage(skin = "yellow",
  dashboardHeader(title = "PAWS Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("WFH", tabName = "wfh", icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    
    tabItems(
      tabItem(tabName = "wfh",
              # Boxes need to be put in a row (or column)
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )
      )
  )
)
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)