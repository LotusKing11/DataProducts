#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
    navbarPage(title = "Exploring factors that affect Vehicle Mileage",
               tabPanel("Factors to Compare",
                    fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                            sidebarPanel(selectInput("variable", "Variable:", c("Number of cylinders" = "cyl",
                                    "Displacement (cu.in.)" = "disp",
                                    "Horsepower" = "hp",
                                    "V/S" = "vs",
                                    "Rear axle ratio" = "drat",
                                    "Weight (lb/1000)" = "wt",
                                    "1/4 mile time" = "qsec",
                                    "Transmission Type" = "am",
                                    "Number of forward gears" = "gear",
                                    "Carburetor Type" = "carb")
                                        )
                                    ),
                                mainPanel(
                                    h3(textOutput("caption")),tabsetPanel(type = "tabs", 
                                        tabPanel("Plot", plotOutput("BoxPlot")),
                                        tabPanel("Regression", plotOutput("mpgPlot"), verbatimTextOutput("fit"))
                                    )
                                )
                            )
                        )
               )
        )
)
    