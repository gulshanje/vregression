
navbarPage("Regression",
           tabPanel("Plot",
                    plotOutput("distPlot")
                    
           ),
           tabPanel("Report",
                    
           ),
           navbarMenu("Plotting",
                      tabPanel("Model A",
                               h1('Model A'),
                               
                               
                               
                      ),
                      tabPanel("Model B",
                               h1('Model B'),
                               
                      )
           ), 
           navbarMenu("Summary",
                      tabPanel("Model A",
                               h1('Model A'),
                                
                               
                      ),
                      tabPanel("Model B",
                               h1('Model B'),
                               
                      )
           ), 
           navbarMenu("Data",
                      tabPanel("Table",
                               dataTableOutput('dataa'),
                               
                      ),
                      tabPanel("About",
                                
                      )
           )
)
