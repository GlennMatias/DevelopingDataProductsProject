library(shiny)
library(dplyr)

shinyServer(function(input, output) {
    
    #----------------------

    
    # Load the datasets
    populationData = read.csv(file="population.csv", head=TRUE)
    regionAreaData = read.csv(file="regionarea.csv", head=TRUE)
    
    #---------------------
    
    
    
    
    
    populationData$mpgsp <- ifelse(populationData$Population - 20 > 0, populationData$Population - 20, 0)
    model1 <- lm(Nhouseholds ~ Population, data = populationData)
    model2 <- lm(Nhouseholds ~ mpgsp + Population, data = populationData)
    
    model1pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model1, newdata = data.frame(Population = mpgInput))
    })
    

    output$plot1 <- renderPlot({
        mpgInput <- input$sliderMPG
        
        plot(populationData$Population, populationData$Nhouseholds, xlab = "Population", 
             ylab = "Number of Households in Region", bty = "n", pch = 16,
             xlim = c(0, 100000), ylim = c(0, 15000))
        if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
  
})