library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Loblolly Pine Age From Height"),
  sidebarLayout(
    sidebarPanel(
      mainPanel("Use the slider to pick a height for your Loblolly Pine Tree.
                See the outputs in the 2 models to see the difference in 
                predicted age"),
      sliderInput("sliderheight", "What is the height of the tree?", 3, 66, value = 30),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
      h3("Predicted Age from Model 1:"),
      textOutput("pred1"),
      h3("Predicted Age from Model 2:"),
      textOutput("pred2")
    ),
    mainPanel(
      plotOutput("plot1"),
      plotOutput("plot2")
    )
  )
))