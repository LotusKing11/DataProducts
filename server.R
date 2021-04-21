#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(datasets)

dataset <- mtcars
dataset$am <- factor(dataset$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {
    
    formula <- reactive({
        paste("mpg ~", input$variable)
    })
    
    formulaPoint <- reactive({
        paste("mpg ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formula()), data=dataset)
    })
    
    output$caption <- renderText({
        formula()
    })
    
    output$BoxPlot <- renderPlot({
        boxplot(as.formula(formula()), 
                data = dataset)
     
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$mpgPlot <- renderPlot({
        with(dataset, { 
          plot(as.formula(formula()))
          abline(fit(), col="blue")
        })
    })
    
})