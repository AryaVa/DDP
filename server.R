## Load the required libraries
library(shiny)
library(ggplot2)
library(dplyr)
## Generate the server side code that calculates the input at ui
shinyServer(function(input, output) {

    output$plot <- renderPlot({

        ## generate price,color,cut based on input$price/color/cut from ui.R
        x    <- diamonds[, 7]
        price <- seq(min(x), max(x), length.out = input$price + 1)
        color<- diamonds[, 3]
        cut<- diamonds[, 2]
        ## draw the plot after filtering the required columns using chain function
        filtered<- diamonds%>%
                   filter(price>= input$price[1],
                          price<= input$price[2],
                          color== input$color,
                          cut== input$cut)
        
        ggplot(filtered,aes(as.factor(clarity),carat))+
              geom_point(color="red", size=2, alpha=0.5)+
              labs(x="Clarity", y="Carat",title="Diamonds")
        ## Draws a plot of carat vs. clarity according to the input given to the parameters defined 
              
     
    })
    
    
})
