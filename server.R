library(data.table)
library(randomForest)
library(openxlsx)
library(readxl)



shinyServer(function(input, output, session) {

  helloKittyData <- reactive({
    voteData <- read.xlsx('static/valt.xlsx', sheet = 'Sheet1',
                          startRow = 1, cols = c(1,2,3,4,5,6),
                          skipEmptyRows = FALSE, detectDates = TRUE)
    
    #print(voteData)
  })
  
  output$dataa <- renderDataTable({
    helloKittyData()
  })
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    data <- data.frame(helloKittyData())
    datapks <- (log(data$PKS, 10))
    #print(datapks)
    
    abline(v = mean(datapks),
           lwd = 2,      # Thickness
           lty = 2)      # Dashed line
  
    hist(datapks, col="coral4", border = 'white')
  })

})
