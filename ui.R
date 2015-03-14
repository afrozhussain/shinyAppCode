library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("'mtcars' Dataset"),
  
  sidebarPanel(
    h3('Histogram Parameters'),
    selectizeInput('var', 'Select Feature:', names(mtcars)),        
    
    checkboxGroupInput(inputId='chk',label='Plot on histogram', 
                       choices=c('Mean (red line)' = '1',
                                 'Median (blue line)' = '2',                                 
                                 'Density Curve' = '4',
                                 '5 figure summary' = '3'
                                 )),
    submitButton('Go!')
    
    ),
  
  mainPanel(
    
    plotOutput('plot1'),
    h4('Skewness:'),
    verbatimTextOutput('oskewness'),
    h4('5 Figure Summary: ( Min. 1st Qu.  Median    Mean 3rd Qu.    Max. )'),
    verbatimTextOutput('osummary')
    
    
    )
  ))