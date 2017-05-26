
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
                            column(12,
                                   h4("Here is some information")
                                   
                                   
                                   
                                   )
                            
                          )
                          
                  )

                )
              )
)




