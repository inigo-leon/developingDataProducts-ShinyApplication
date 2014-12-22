library(shiny)
shinyServer(function(input, output) {
  data <- reactive({
    if (input$distributionType=='rnorm'){
        rnorm(input$nObservations, mean=input$mean, sd=input$sd)
    }else{
        runif(input$nObservations, min=input$min, max=input$max)
    }
    
  })

  output$plot <- renderPlot({
    hist(data(), 
         main=paste(input$distributionType, '(', input$nObservations, ')', sep=''))
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
})