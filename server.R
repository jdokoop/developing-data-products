library(shiny)
library(googleVis)

#Create the server for the Shiny application
shinyServer(function(input, output){
  futureYear <- reactive({input$year})
  
  output$map <- renderGvis({
    #Translate string input for region into Google codes
    geoRegion = ""
    if(identical(input$region, "South America"))
    {
      geoRegion="005"
    }
    else if(identical(input$region, "Europe"))
    {
      geoRegion="150"
    }
    else if(identical(input$region, "North America"))
    {
      geoRegion="021"
    }
    else if(identical(input$region, "Central America"))
    {
      geoRegion="013"
    }
    else if(identical(input$region, "Africa"))
    {
      geoRegion="002"
    }
    else if(identical(input$region, "Asia"))
    {
      geoRegion="142"
    }
    else if(identical(input$region, "World"))
    {
      geoRegion="world"
    }
    
    #Prepare the data to use in the visualization
    #Load data frame from CSV file and select only complete cases
    df <- read.csv("internet_users.csv", na.strings = "..")
    df <- na.omit(df)
    
    #List with years for availble measurements from 2000-2012
    years <- c(2000:2012)
    
    #Fit a linear model to each row of the data frame
    #Model is users ~ year
    linear.models <- apply(df, 1, function(x) lm(as.numeric(x[3:15]) ~ years))
    
    #Evaluate linear models for some year
    futureUsers <- sapply(linear.models, function(x) predict(x, newdata=data.frame(years=c(futureYear()))))

    #Add predictions to original data frame
    df <- cbind(df,futureUsers)
    #Check that usage does not go over 100%
    df$futureUsers <- replace(df$futureUsers, df$futureUsers > 100, 100)
    
    #Plot things in a map
    gvisGeoChart(df, locationvar="Country", colorvar="futureUsers", options=list(region=geoRegion,colorAxis="{values:[0,50,100],
                                   colors:['yellow', 'orange', 'red']}"))
  })
})