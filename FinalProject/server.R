
library(shiny)
shinyServer(function(input, output) {
  
  tree <- Loblolly
  
  
  model1 <- lm(age~height, data=tree)
  model2 <- lm(I(age^.5)~height, data=tree)
  
  
  model1pred <- reactive({
    heightInput <- input$sliderheight
    predict(model1, newdata = data.frame(height = heightInput))
  })
  
  model2pred <- reactive({
    heightInput <- input$sliderheight
    predict(model2, newdata = data.frame(height = heightInput))
  })
  
  output$plot2 <- renderPlot({
    heightInput <- input$sliderheight
    
    plot(tree$height, (tree$age)^.5, xlab = "Height in Feet", 
         ylab = "Age in Years ^ 1/2 Power", main="Model 2 - Age^2", bty = "n", pch = 16)
    if(input$showModel2){
      abline(model2, col = "red", lwd = 2)
    }
      points(heightInput, model2pred(), col="blue", pch=16, cex=2)
    
    
    })


  output$plot1 <- renderPlot({
   heightInput <- input$sliderheight
  
  plot(tree$height, tree$age, xlab = "Height in Feet", 
       ylab = "Age in Years", main="Model 1 - Age vs Height", bty = "n", pch = 17)
 
  if(input$showModel1){
    abline(model1, col = "red", lwd = 2)
  }
  points(heightInput, model1pred(), col="red", pch=16, cex=2)
})

  output$pred1 <- renderText({
    model1pred()
  })
  

  
  output$pred2 <- renderText({
    model2pred()^2
  })
  
})
#--------------------------------


