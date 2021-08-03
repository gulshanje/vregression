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

})
