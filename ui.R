library(shiny)

shinyUI(pageWithSidebar(
  
    headerPanel("Predict Miles Per Gallon of a Manual/Automatic Car"),
    
    sidebarPanel(
        h3("How this application works:"),
        helpText("Enter Weight , Qsec and Transmisson , then click on ",strong("PREDICT")," to get prediction of MPG."),
        numericInput("Weight","Weight",value=1,min=1.513,max=5.424),
        br(),
        radioButtons("Trans","Transmission",list("Automatic" = 0,"Manual" = 1),"0"),
        sliderInput("Qsec", "QSec", value = 18, min = 14, max = 23,animate=T),
        actionButton("actionButton","PREDICT",align = "center")
     
    ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Prediction",
                     h2("Basic MPG Predction ",align="center") ,
                     p("The predicted",span(" MPG value",style = "color:red")," and its",span(" Lower Bound",style="color:red"),"and",
                       span("Upper Bound",style="color:red")," values are :"),
                     
                     code(textOutput("myp"))
            ),
            
            tabPanel("Table", 
                     h2("mtcars Dataset"),
                     tableOutput("table"))
          
            )

)
))