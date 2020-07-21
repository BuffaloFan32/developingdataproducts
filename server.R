#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    model1 <- lm(eruptions ~ waiting, data = faithful)
    
    model1pred <- reactive({
        waitInput <- input$waitTime
        predict(model1, newdata = data.frame(waiting = waitInput))
    }
    )
    
    
    
    output$plot1 <- renderPlot({
        waitInput <- input$waitTime
        
        plot(faithful$waiting, faithful$eruptions, xlab = "Length of Wait", 
             ylab = "Length of Eruption", bty = "n", xlim = c(0, 100), ylim = c(0, 6))
        
        abline(model1, col = "red", lwd = 2)
        
        points(waitInput, model1pred(), col = "blue", pch = 16, cex = 2)
        
        output$pred1 <- renderText({
            model1pred()
        })
            
            
    }
    )
    
}
)
    