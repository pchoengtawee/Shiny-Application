library(shiny)

mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)

model <- lm(mpg ~. ,  data=mtcars)
selected_model <- step(model,direction="both")
summary(selected_model)

shinyServer(function(input, output) {
    
    output$myTrans <- renderText({ input$Trans })
    
    output$myp <- renderText({ 
        input$actionButton
        isolate({
            # factor are wt ,qsec,and am
            newdata = data.frame(wt=we(),qsec=input$Qsec, am=input$Trans)
            myp  <- predict(selected_model,newdata , interval = "predict")
          
        })
    })
    
    we <- reactive({
        w <- as.numeric(input$Weight)
    })
    
    # Generate an HTML table 
    output$table <- renderTable({
        data.frame(mtcars)
    })
})
