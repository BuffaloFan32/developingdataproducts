#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Length of Eruption Based on Time Between Eruptions"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("waitTime", "Time since previous eruption (min)", 40, 100, value = 70),
            h4("Move the slider to the observed wait time in minutes.  The output will show 
               the predicted value of the length of the eruption based on linear regression 
               performed on R's 'faithful' dataset")
        ),
    mainPanel(
        plotOutput("plot1"),
        h3("Predicted Eruption Length (min):  "),
        textOutput("pred1")
    )
    )
))
