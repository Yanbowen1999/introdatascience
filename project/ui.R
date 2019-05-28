#install.packages("dplyr")
#devtools::install_github("tidyverse/dplyr")
#install.packages('shinythemes')
library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  shinythemes::themeSelector(),
  #tags$head(tags$style("body{ color: blue; }")),
  titlePanel("Liquor Store prices"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
      radioButtons("typeInput", "Product type",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE"),
      uiOutput("countryOutput")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel('Plot',plotOutput("coolplot")),
        tabPanel('Table',tableOutput("results"))
      )
    )
  )
))
