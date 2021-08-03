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
  
  output$plotModelA <- renderPlot({
    pointData <- data.frame(helloKittyData())
    log_PKS <- (log(pointData$PKS, 10))
    modelA <- lm(log_PKS ~ VAESTONKASVU + TALOUSKASVU + EU28_hintaindeksi + Uudisrakentaminen  , data = pointData)
    windows.options(width=100, height=100)
    
    par(mfrow = c(2,2))
    plot (modelA,col =  c("#00AFBB", "#E7B800", "#FC4E07"),
          pch = c(16, 17, 18) )
    
  },  height = 750, width = 900)
  
  output$plotModelB <- renderPlot({
    pointData <- data.frame(helloKittyData())
    modelB <- lm(PKS~  VAESTONKASVU + TALOUSKASVU + EU28_hintaindeksi + Uudisrakentaminen  , data = pointData)
    summary(modelB)
    par(mfrow = c(2,2))
    plot (modelB,col =  c("#00AFBB"),
          pch = c(18) )
  },  height = 900, width = 900)
  
  # output$summaryModelA <- renderPrint({
  #   data <- data.frame(helloKittyData())
  #   log_PKS <- (log(data$PKS, 10))
  #   modelOne <- lm(log_PKS~ VAESTONKASVU + TALOUSKASVU + EU28_hintaindeksi + Uudisrakentaminen  , data = data)
  #   summary(modelOne)
  # })
  # output$summaryModelB <- renderPrint({
  #   data <- data.frame(helloKittyData())
  #   modelTwo <- lm(PKS~  VAESTONKASVU + TALOUSKASVU + EU28_hintaindeksi + Uudisrakentaminen  , data = data)    
  #   summary(modelTwo)
  # })
  

})
