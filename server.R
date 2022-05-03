library(DT)
library(rsconnect)
library(readr)
library(shiny)
library(cluster)

function(input, output, session) {
  
  # Hotels dataset
  hotels <- read.csv("./Data/hotels.csv")
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    # Filter Hotel Profit
    hotels <- subset(hotels,  Profit >= input$profit[1])
    hotels <- subset(hotels,  Profit <= input$profit[2])
    
    # Filter Price of Hotel
    hotels <- subset(hotels,  Price.in.Millions >= input$price[1])
    hotels <- subset(hotels,  Price.in.Millions <= input$price[2])
    
    # Filter Hotel Area in Square Meters
    hotels <- subset(hotels,  Square.Meter >= input$area[1])
    hotels <- subset(hotels,  Square.Meter <= input$area[2])
    
    # Output filtered hotel data
    hotels[c(input$xcol, input$ycol)]
    
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  # Output k-means cluster plot
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
  # Output hotel dataset table
  output$table = DT::renderDataTable({
    hotels
  })
  
  # Output submission questions UI
  output$subquestions <- renderUI({ 
    tagList(
      h4("What data you collected?"),
      hr(),
      p("The data I collected was from a simple hotel dataset, which contains data about various hotels’ price, 
        profit per year, area in square meters and the city they are located in. The dataset can be accessed on Kaggle using the link below:"),
      a("https://www.kaggle.com/datasets/sveneschlbeck/hotel-prices-beginner-dataset"),
      h4("Why this topic is interesting or important to you? (Motivation)"),
      hr(),
      p("This topic is important to me because I am very interested in real estate. One of my goals in the future is to own and rent properties. 
        This dataset allows you to observe the relations between the price, profit, area and city of the hotels. 
        This can provide key insight for someone looking to purchase and operate a hotel. 
        For example, one can use this data to find a hotel that yields maximum profit, while remaining small in square-meter area."),
      h4("How did you analyze the data?"),
      hr(),
      p("This data was analyzed using the k-means clustering machine learning methodology. The algorithm for this methodology is as follows:"),
      tags$ol(
        tags$li("Select k points to represent initial group centroids"),
        tags$li("Assign each point to a group around the initial centroids"),
        tags$li("Once all points have been assigned, adjust the centroids of the groups"),
        tags$li("Repeat steps 2 and 3 until the centroids cannot be adjusted any further")
      ),
      p("The result is a cluster that is now divided into groups based on a specific criteria."),
      p("The benefits of this method are that it is efficient, flexible and easy to implement. 
        However, some drawbacks are that it does not handle categorical variables and there is not always a guarantee that the optimal set of clusters will be found."),
      h4("What did you find in the data?"),
      hr(),
      p("By using the shiny app to plot various parameters on the graph, I found interesting relationships in the data. 
        I expected each attribute in the data to have somewhat of a linear relationship with the other two. 
        However, the only linear relationship is between Price and Square Meters. 
        It seems that Profit has a random relationship with the other two attributes. 
        This can be seen by interacting with the app, using the X-variable and Y-variable selectors to view these relationships on the plot.")
    )
  })
  
}