# k-means only works with numerical variables,
# so don't give the user the option to select
# a categorical variable
library(DT)
library(rsconnect)
library(readr)
library(shiny)
library(cluster)

hotels <- read.csv("./Data/hotels.csv")

# Remove "City" column to keep only the numeric values in the table
vars <- setdiff(names(hotels), "City")

# UI layout
pageWithSidebar(
  headerPanel('Hotel K-Means Clustering'),
  # Sidebar layout containing inputs for parameters
  sidebarPanel(
    selectInput('xcol', 'X Variable', vars),
    selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
    numericInput('clusters', 'Cluster count', 3, min = 1, max = 9),
    sliderInput("profit", "Profit Per Year", min = 0, max = 250000, value = c(0, 250000),  sep = ",", pre="$"),
    sliderInput("price", "Price (Millions of Euros)", min = 0, max = 40, value = c(0, 40),  sep = ",", pre="$"),
    sliderInput("area", "Area (Square Meters)", min = 0, max = 6000, value = c(0, 6000),  sep = ",")
  ),
  # Main panel containing project info and tabs for outputs
  mainPanel(
    h3("About This Shiny App"),
    hr(),
    p("This application uses the k-means clustering machine learning modelling methodology. 
      This is a method applied to clustered data to split the data points into 'k' number of groups, based on similar attributes.
      These groups are called clusters and are centered around points called centroids. 
      In this app, the clusters are differentiatied by color and the centroid is illustrated by an 'X'."),
    p("This app uses a simple Hotel dataset found at https://www.kaggle.com/datasets/sveneschlbeck/hotel-prices-beginner-dataset"),
    p("The dataset contains 4 columns: Profit the hotel makes per year, 
    Price to buy the hotel in millions, the Hotel Area in sqaure meters and the 
    City the hotel is located in. This app allows the user to plot the data points of the hotel to analyze the relations between its profit, 
    price and square meter area. Each of these attributes can be selected using the X and Y Variable selectors
    and filtered using the sliders in the sidepanel. The cluster count can also be selected as a number from 1-9."),
    
    #Tabset Panel to display different outputs on main page
    tabsetPanel(type = "pills",
                tabPanel("K-means Plot", plotOutput("plot1")),
                tabPanel("Hotel Data Table", DT::dataTableOutput("table")),
                tabPanel("Submission Questions", uiOutput("subquestions"))
    )
  )
)