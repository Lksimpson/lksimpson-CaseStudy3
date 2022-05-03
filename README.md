# DS-501 Case Study 3

### About The App

Launch the app by clicking https://lksimpson.shinyapps.io/lksimpson-CaseStudy3/ or by running this command in the Rstudio Console 
<pre><code>shiny::runGitHub("lksimpson-CaseStudy3", "lksimpson")</code></pre>

This application uses the k-means clustering machine learning modelling methodology. 
This is a method applied to clustered data to split the data points into 'k' number of groups, based on similar attributes.
These groups are called clusters and are centered around points called centroids. 
In this app, the clusters are differentiatied by color and the centroid is illustrated by an 'X'.

This app uses a simple Hotel dataset found using Kaggle.
The dataset contains 4 columns: Profit the hotel makes per year, Price to buy the hotel in millions, 
the Hotel Area in sqaure meters and the City the hotel is located in. 
This app allows the user to plot the data points of the hotel to analyze the relations between its profit, price and square meter area. 

### Interactive Features

The user can change the following parameters to interact with the app:
- X-Variable: Selects a column to plot on the x-axis of the graph
- Y-Variable : Selects a column to plot on the y-axis of the graph
- Cluster Count: The number of clusters to form out of the plotted data points (ranges from 1-9) using k-means clustering
- Profit Per Year: Slider that filters the data to within the specified range for Profit
- Price (Millions Per Year): Slider that filters the data to within the specified range for Price
- Area (Square Meters): Slider that filters the data to within the specified range for Square Meters
- K-Means Plot Tab: Displays the k-means clustering plot based on the input in the sidebar
- Hotel Data Table Tab: Displays the original hotel dataset as a table
- Submission Questions Tab: Displays the answers to the questions listed on the Canvas assignment

### Submission Questions

#### What data you collected?

The data I collected was from a simple hotel dataset, which contains data about various hotels’ price, profit per year, 
area in square meters and the city they are located in. 
The dataset can be found on Kaggle at https://www.kaggle.com/datasets/sveneschlbeck/hotel-prices-beginner-dataset,

#### Why this topic is interesting or important to you? (Motivation)

This topic is important to me because I am very interested in real estate. One of my goals in the future is to own and rent properties. 
This dataset allows you to observe the relations between the price, profit, area and city of the hotels. 
This can provide key insight for someone looking to purchase and operate a hotel. 
For example, one can use this data to find a hotel that yields maximum profit, while remaining small in square-meter area.

#### How did you analyze the data?

This data was analyzed using the k-means clustering machine learning methodology. The algorithm for this methodology is as follows:
1. Select k points to represent initial group centroids
2. Assign each point to a group around the initial centroids
3. Once all points have been assigned, adjust the centroids of the groups
4. Repeat steps 2 and 3 until the centroids cannot be adjusted any further
The result is a cluster that is now divided into groups based on a specific criteria.

The benefits of this method are that it is efficient, flexible and easy to implement. 
However, some drawbacks are that it does not handle categorical variables and 
there is not always a guarantee that the optimal set of clusters will be found.
	
#### What did you find in the data? (please include figures or tables in the report)

By using the shiny app to plot various parameters on the graph, I found interesting relationships in the data. 
I expected each attribute in the data to have somewhat of a linear relationship with the other two. 
However, the only linear relationship is between Price and Square Meters. 
It seems that Profit has a random relationship with the other two attributes. 
This can be seen by interacting with the app, using the X-variable and Y-variable selectors to view these relationships on the plot.
