

library(shiny)


shinyServer(function(input, output,session) {
  days <-reactive({
    return(input$days)
  })
  
  #function to simulate, need to find a better way to do this
  func <- reactive({
    d = days()
    z = rnorm(d,mean = 30, sd = 4)
    z2 = numeric(d)
    for(q in 1:d){
      #z2[q] = (z[q]- 30)/4/sqrt(30)
      z2[q] = z[q]
    }
    p = numeric(d)
    
    for(c in 1:d)
    {
      if(z[c]<=0){
        p[c] = pnorm(z2[c], mean = 30, sd =4)
        
      }
      else{
        p[c] = pnorm(z2[c],mean = 30, sd = 4, lower.tail = FALSE)
      }
    }
    p = p
  })


  output$p.plot<-renderPlot({
    p = func()
    plot(p,ylim = c(0,1))
    abline(h = 0.05, col = "green", lwd = 2)
  })
  
  
})

