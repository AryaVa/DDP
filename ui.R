## Load the required library
library(shiny)
## Generate the code for ui
shinyUI(navbarPage("Diamonds Data",

    ## Application title
    
    ## Tabs for documentation and plot
    tabPanel("Plot",
    ## Sidebar with a slider input, radio buttons and select box
    sidebarLayout(
        sidebarPanel(
            sliderInput("price", "PRICE", min = 326, max = 18823, value=c(330,350)),
           selectInput("color", "COLOR", choices=c("D","E","F", "G","H","I", "J")),
           radioButtons("cut", "CUT", choices=c("Fair", "Good", "Very Good", "Premium", "Ideal"),inline=TRUE,selected=NULL)
        ),

        ## Show a plot of the generated distribution
        mainPanel(
          plotOutput("plot")
                     
            
        ))),
        tabPanel("About",
                 mainPanel(
                   includeMarkdown("about.md")))
    )
)
