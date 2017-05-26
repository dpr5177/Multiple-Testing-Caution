
library(shiny)
library(shinydashboard)

dashboardPage(skin="blue",
              
              #Title
              dashboardHeader(title="Multiple Testing Caution",titleWidth=450),
              
              #Sidebar
              dashboardSidebar(
                width = 260,
                sidebarMenu(
                  
                  menuItem("Overview", tabName = "over", icon = icon("university")),
                  menuItem("Part 1", tabName = "first", icon = icon("pencil-square"))
                )),
              
              #Content within the tabs
              dashboardBody(
                tabItems(
                  
                  tabItem(tabName = "over",
                          
                          fluidRow(
                            #column of length 12 which is the whole width
                            #I include everthing in a column though because this way there are margins and it looks better
                            column(12,
                                   h3("About"),
                                   h4("In this app you will explore the Multiple Testing Caution."),
                                   h4("In Part 1 you will look at this.")
                                   
                            )
                          )
                  ),
                  
                  #Define the content contained within part 1 ie. tabname "first"
                  tabItem(tabName = "first",
                          fluidRow(
                            #Include LaTeX functioality although I don't think I used it for this
                            withMathJax(),
                            column(6,
                                   h3("The Problem: **use a real situation here with actual data**"),
                                   box(width =12,background = "blue",
                                       "Example situation:", br(),br(),
                                       "A pizza store claims their average delivery time is 30 minutes and a standard deviation of 4 minutes, you think the true meanis longer.",br(),
                                       " You collect 30 times from every day for 130 days",br(),
                                       " H0: the mean delivery time is 30 minutes for a pizza company",br(),
                                       " H1: the mean delivery time is greater than 30 minutes",br(),
                                       " Now suppose you run a test for significance every day.",br(),
                                       "Does the null hypothesis provide a reasonable explanation for the data?"
                                       
                                       ),
                                   numericInput(inputId = "days", "See how the plot changes when you change how many significance tests you are running", min = 1, max = 200, val = 130)
                                   
                                   ),
                            column(6,
                                   h3("This is the data"),
                                   plotOutput("p.plot"),
                                   h4("The points above the green line on the plot are all pvalues you might consider high. In other words the points above the greeen line represent days when you would conclude the null hypothesis provides a reasonable explanation for the data")
                                   )
                            
                          )
                          
                  )

                )
              )
)




