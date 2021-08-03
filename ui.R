
navbarPage("L-Regression",
           tabPanel("Home",
                    plotOutput("distPlot")
                    
           ),
           tabPanel("Report",
                    
           ),
           navbarMenu("Plotting",
                      tabPanel("Model A",
                               h1('Model A'),
                               plotOutput("plotModelA")
                               
                               
                      ),
                      tabPanel("Model B",
                               h1('Model B'),
                               plotOutput("plotModelB")
                      )
           ), 
           navbarMenu("Summary",
                      tabPanel("Model A",
                               h1('Model A'),
                               #verbatimTextOutput("summaryModelA")
                               
                      ),
                      tabPanel("Model B",
                               h1('Model B'),
                               #verbatimTextOutput("summaryModelB")
                      )
           ), 
           navbarMenu("Data",
                      tabPanel("Table",
                               dataTableOutput('dataa'),
                               
                      ),
                      tabPanel("About",
                               h1('Talous'),
                               h3('Group Member'),
                               p('Valtteri'),
                               p('Gulshan'),
                               p('Martti'),
                               p('Tiina')
                      )
           )
)
