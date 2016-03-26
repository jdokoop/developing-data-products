library(shiny)

#Create user interface for application 
shinyUI(fluidPage(

  titlePanel("Predicting the Percentage of World Population with Internet Access Between 2017-2030"),
  helpText("Hover over each country to see fraction of population with access to the Internet. Data was not available for all nations."),
  htmlOutput("map"),
  hr(),
  fluidRow(
    column(4,sliderInput("year", "Select a Year:", min=2017, max=2030, value = 2017, step=1, format="## Year") ),
    column(4,offset=1,radioButtons("region", "Geographical Region", choices=c("World","North America", "Central America", "South America", "Europe", "Africa", "Asia"), selected="World"))
    )
))