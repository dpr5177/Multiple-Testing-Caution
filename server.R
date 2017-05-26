

library(shiny)


shinyServer(function(input, output,session) {
  days <-reactive({
    return(input$days)
  })
  
  #First thought on simulating it
  #function to simulate, need to find a better way to do this
  func <- reactive({
    d = days()
    z = rnorm(d,mean = 30, sd = 4)
    z2 = numeric(d)
    for(q in 1:d){
      z2[q] = (z[q]- 30)/4
      #z2[q] = z[q]
    }
    p = numeric(d)
    
    for(c in 1:d)
    {
      if(z[c]<=0){
        p[c] = pnorm(z2[c], mean = 0, sd =1,lower.tail = TRUE)
        
      }
      else{
        p[c] = pnorm(z2[c],mean = 0, sd = 1, lower.tail = FALSE)
      }
    }
    p = p
  })
  
  
  
  #I think this way is better
  #Second thought on simulating this
  #Binomial might not be the best
  #Idea is to randomly generate x number of data points (days)
  #       and each day has 5% chance of having a small pvalue
  func2 <- reactive({
    n1 = days()
    r = numeric(n1)
    sim1 = rbinom(n = n1,size = 1, prob = 0.95)
    for(w in 1:n1){
      if(sim1[w]==1){
        r[w] = runif(1, 0.05001,0.999)
      }
      else{
        r[w] = runif(1, 0.0001, 0.05)
      }
    }
    r = r
    
  })
  
  #Plot for the first idea
  output$p.plot<-renderPlot({
    p = func2()
    plot(p,ylim = c(0,1), ylab = "p-value",main = "p-values of multiple tests", xlab = "Test", xlim = c(0,500))
    abline(h = 0.05, col = "green", lwd = 2)
  })
  

  
})

