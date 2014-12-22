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
      if (input$distributionType=='rnorm'){
          hist(data(), main=paste('rnorm(', input$nObservations, ',', input$mean,',', input$sd,')', sep=''))
      }else{
          hist(data(), main=paste('runif(', input$nObservations, ',', input$min,',', input$max,')', sep=''))
      }
    
  })
  
  output$summary <- renderPrint({
    summary(data())
  })
  
  output$table <- renderTable({
    data.frame(x=data())
  })
})