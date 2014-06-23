
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    bey <- read.csv("bey.csv")
   
   
  output$distPlot <- renderPlot({
    
    subbey <- bey[bey$labels %in% input$checkGroup,]
    facts <- factor(subbey$labels)
    
    mu <- signif(mean(subbey$age), 4)
    md <- median(subbey$age)
    
    ggplot(data = subbey, aes(age, color = factor(labels))) + 
        geom_density(adjust=2) + 
        geom_vline(aes(xintercept=mean(age))) + 
        annotate("text", x = 75, y = 0.02, label = paste("Mean: ", mu)) +
        annotate("text", x = 75, y = 0.021, label = paste("Median: ", md)) +
        theme_bw()
  })
  
})
