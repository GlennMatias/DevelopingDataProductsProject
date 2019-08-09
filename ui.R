library(shiny)
shinyUI(fluidPage(
  titlePanel("Number of Households based on Population"),
  sidebarLayout(
    sidebarPanel(
      h5("Dataset used is the Philippines' National Statistics office's data on the country's information about its population. The dataset contains the following information:"),
      h6("-Region"),
      h6("-Barangay"),
      h6("-Province"),
      h6("-Population"),
      h6("-City"),
      h6("-Number of Households"),
      h5("Instructions: This interactive UI aims to predict the number of Households in a population of people. Use the slider to predict the number of Household based on the Population count in the slider"),
      
      sliderInput("sliderMPG", "What is the Population of the Region?", 0, 70000, value = 20),
      checkboxInput("showModel1", "Show Regression Line", value = TRUE),
      submitButton("Submit")

    ),
    mainPanel(
      plotOutput("plot1"),
      h4("Estimated number of Household based on Population selected"),
      textOutput("pred1")
      
    )
  )
))