
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Comparison of Voter Age Distributions"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    p("This is a comparison of age distributions in different voter groups in Beirut, Lebanon. Select different groups below to see the plot of the distribution as well as the mean and median age of the combined electors."),
    p("The data was obtained from ",a("lebanonelectiondata.org", href="http://lebanonelectiondata.org"), "and translated from arabic. I've included a csv of the data in my repo."),
    checkboxGroupInput("checkGroup", 
                       label = h3("Select group"), 
                       choices = list("Sunni" = 'Sunni', 
                                      "Shia" = 'Shia', 
                                      "Maronite Christian" = 'Maronite Christian',
                                      "Druze" = 'Druze',
                                      "Jewish" = 'Jewish',
                                      "Christian Minorities" = 'Christian Minorities',
                                      "Other Minorities" = 'Other Minorities'),
                       selected = c('Sunni', 'Shia'))
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  )
))
