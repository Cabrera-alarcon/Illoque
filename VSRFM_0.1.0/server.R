

##############################
# Author: Cabrera-Alarcon JL #
##############################

library(shiny)
library(shinyFiles)
library(randomForest)
source('enviroment.R')

shinyServer(function(input, output, session) {

  file.input<-reactive({
    req(input$file)
    inFile<-input$file
    print('VSRFM')
    tabla<-read.table(inFile$datapath, header = T, sep = '\t', dec = '.', stringsAsFactors = F)
    return(tabla)
  })
  datos<-reactive({
    req(file.input())
    variantes.to.test<-file.input()
    variantes.to.test$VSRFM <- VSRFM(variantes.to.test[,-12])
    variantes.to.test$Class <- 'Benign'
    variantes.to.test$Class[which(variantes.to.test$VSRFM >= input$VSRFM_thres)] <- 'Pathogenic'
   
    return(variantes.to.test)
  })
  #output$title.VSRFM<-renderText('VSRFM')
  output$plot01<-renderPlot({
    par(cex=1.5)
    req(datos())
    datos.pie<-datos()
    #print(head(datos.pie))
    tabla<-table(datos.pie$Class)
    pie(tabla,  labels = tabla, main = 'Variants distribution', col = rainbow(length(names(tabla))))
    #pie3D(tabla,explode = 0.3, labels = paste0(names(tabla),':',tabla),labelcex=1, main = 'Variants consequence distribution')
    legend("right", names(tabla), cex = 0.7,fill = rainbow(length(names(tabla))) )
  })
  output$VSRFM<-renderText('VSRFM')
  output$Data.table<-renderDataTable({
    req(datos())
    datos<-datos()
    return(datos)
  })
  output$VSRFM.list.Download <- downloadHandler(
    filename ='VSRFM.list.csv',
    content = function(file) {
      datos<-datos()
      write.csv(datos, file, row.names = FALSE)
    }
  )
  file.input2<-reactive({
    req(input$file2)
    inFile<-input$file2
    print('VSRFM-s')
    tabla<-read.table(inFile$datapath, header = T, sep = '\t', dec = '.')
    return(tabla)
  })
  datos2<-reactive({
    req(file.input2())
    variantes.to.test<-file.input2()
    variantes.to.test$VSRFMs <- VSRFMs(variantes.to.test)
    variantes.to.test$Class <- 'Benign'
    variantes.to.test$Class[which(variantes.to.test$VSRFM >= input$VSRFMs_thres)] <- 'Pathogenic'
    
    return(variantes.to.test)
  })
  #output$title.VSRFM<-renderText('VSRFM')
  output$plot02<-renderPlot({
    par(cex=1.5)
    req(datos2())
    datos.pie<-datos2()
    #print(head(datos.pie))
    tabla<-table(datos.pie$Class)
    pie(tabla,  labels = tabla, main = 'Variants distribution', col = rainbow(length(names(tabla))))
    #pie3D(tabla,explode = 0.3, labels = paste0(names(tabla),':',tabla),labelcex=1, main = 'Variants consequence distribution')
    legend("right", names(tabla), cex = 0.7,fill = rainbow(length(names(tabla))) )
  })
  output$VSRFMs<-renderText('VSRFM-s')
  output$Data.table2<-renderDataTable({
    req(datos2())
    datos<-datos2()
    return(datos)
  })
  output$VSRFMs.list.Download <- downloadHandler(
    filename ='VSRFMs.list.csv',
    content = function(file) {
      datos<-datos2()
      write.csv(datos, file, row.names = FALSE)
    }
  )
})

  