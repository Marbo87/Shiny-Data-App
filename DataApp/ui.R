#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Fuel consumption of cars from 2011 or 2012"),

    sidebarLayout(
        sidebarPanel(
            h2("Model Selection"),
            # Radiobutton to choose the year
            radioButtons("year", "Year:",
                         c("2011" = "y11",
                           "2012" = "y12")),
            # Radiobutton to choose a model
            radioButtons("mod", "Model:",
                         c("Linear" = "lm",
                           "Quadratic" = "qm")),
            # Slider to choose an x-value to plot as a point
            sliderInput("xval",
                        "x-value of point to plot (blue):",
                        min = 1,
                        max = 8,
                        value = 4),
            h3("y-value of chosen data"),
            textOutput("pty")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
