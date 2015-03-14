library(shiny)
library(datasets)
data(mtcars)
shinyServer(
  function (input, output)
  { 
  
   output$plot1 <- renderPlot({
                h <- hist(mtcars[,{input$var}], main= paste('Histogram of ', {input$var}),
                     xlab = {input$var},
                     ylab= 'count')
                
                if( 1 %in% input$chk)
                abline(v=mean(mtcars[,{input$var}]) , lwd = 3, col= 'red' )
                if( 2 %in% input$chk)
                abline(v=median(mtcars[,{input$var}]) , lwd = 3, col= 'blue' )
                
                if( 4 %in% input$chk)
                {
                x <- mtcars[,{input$var}]
                
                xfit<-seq(min(x),max(x),length=40) 
                yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
                yfit <- yfit*diff(h$mids[1:2])*length(x) 
                lines(xfit, yfit, col="gray", lwd=2)}
                              
                
   }
     )  
   
   output$oskewness <- renderText({
     x <- mtcars[,{input$var}]
    if(mean(x) > median(x))  'right skewed'
    else if(mean(x) < median(x)) 'left skewed'
    else if (mean(x) == median(x)) 'symetric'
     })
   
   output$osummary <- renderText({
     if (3 %in% input$chk) summary(mtcars[,{input$var}])  
     else 'Not selected'
       
   })    
    
     
   
     
    
  }
  )