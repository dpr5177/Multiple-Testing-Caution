
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
                                       "When the null hypothesis is true there is a small chance of getting a low p-value and declaring the result highly significant (from the definition of the p-value).  So if you look at a lot significance tests, finding one that is highly significant is expected."
            
                                       ),
                                   h3("Notice how there tend to be more 'significant' pvalues on the plot when you increase the number of tests"),
                                   br(),
                                   numericInput(inputId = "days", "Adjust how many significance tests you are running here:", min = 0, max = 500, val = 5,step = 10)
                                   
                                   ),
                            column(6,
                                   h3("This is the data"),
                                   plotOutput("p.plot"),
                                   h4("The points above the green line on the plot are all pvalues you might consider high. In other words the points above the greeen line represent the tests where you might conclude the null hypothesis provides a reasonable explanation for the data")
                                   )
                            
                          )
                          
                  )

                )
              )
)




