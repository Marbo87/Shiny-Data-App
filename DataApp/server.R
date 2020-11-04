#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(AppliedPredictiveModeling)
data(FuelEconomy)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    dat <- reactive({
        xin2 <- input$year
        if (xin2 == "y11") {
            cars2011$EngDispl2 <- cars2011$EngDispl^2
            cars2011
        }
        else {
            cars2012$EngDispl2 <- cars2012$EngDispl^2
            cars2012
        }
    })
    x <- reactive({
        dat()$EngDispl
    })
    x2 <- reactive({
        dat()$EngDispl2
    }) 
    y <- reactive({
        dat()$FE
    })
    model1 <- reactive({
        lm(y() ~ x(), data = dat()) 
    })
    model2 <- reactive({
        lm(y() ~ x() + x2(), data = dat()) 
    })
    
    py <- reactive({
        xin <- input$xval
        if(input$mod == "qm")
            model2()$coef[1] + xin*model2()$coef[2] + xin^2*model2()$coef[3] #predict(model2(), newdata = data.frame(x = xin, x2 = xin^2))
        else
            model1()$coef[1] + xin*model1()$coef[2] #predict(model1(), newdata = data.frame(x = xin))
    })
    
    output$distPlot <- renderPlot({
        #dat()$EngDispl2 <- x^2
        xp <- seq(0, 8, 0.2)
        yp <- model2()$coef[1] + xp*model2()$coef[2] + xp^2*model2()$coef[3] # predict(model2(), list(x = xp, x2 = xp^2))
        # draw the plot with the specified data and prediction from the specified model
        plot(x(), y(), xlab = "Engine Displacement", ylab = "Fuel efficiency (mpg)")
        abline(model1(), col = "red", lwd = 3)
        lines(xp, yp, col = "darkgreen", lwd = 3)
        px <- input$xval
        points(px, py(), col = "blue", pch = 19, cex = 2.5)
        
    })
    output$pty <- renderText({
        round(py(), 2)
    })
})
