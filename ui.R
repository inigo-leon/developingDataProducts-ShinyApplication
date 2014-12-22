library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Distributions"),
    sidebarPanel(
        numericInput("nObservations", label = "Number of observations:", value = 100, min = 10, max = 10000),
        radioButtons("distributionType", "Distribution type:",
                   c("Uniform"  =   "runif",
                     "Normal"   =   "rnorm")),
      br(),  
      numericInput("min", label = "Min value:", value = 0),
      numericInput("max", label = "Max value:", value = 1),
      br(),
      numericInput("mean", label = "Mean:", value = 0),
      numericInput("sd", label = "Standard deviation:", value = 1),
      
      submitButton("Apply Changes"),
      
      br(), 
      h3('Documentation'), 
      p('This app simulates the creation of data for Normal and Uniform distributions'), 
      code('rnorm'), code('runif'),
      p('The use of this application is as follows:'),
      p('1. Enter the number of observations to create (from 10 to 10000'),
      p('2. Select the distribution to simulate: Normal or Uniform'),
      p('3a. If Normal distribution is selected, enter both the mean and the standard deviation'),
      p('3b. If Uniform distribution is selected, enter both the min and the max of the range'),
      p('4. Press the apply changes button for updating the plot and data'),
      p(' '),
      p('The Right panel consists of two tabs: 
        one for the summary and the Plot of the distribution and
        another one to show the generated data.')
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Summary and Plot", verbatimTextOutput("summary"), plotOutput("plot")),
                  tabPanel("Generated Data", tableOutput("table"))
    )
  )
))