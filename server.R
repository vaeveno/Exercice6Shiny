#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw a histogram
function(input, output, session) {
  output$salutation <- renderText({
    paste0("Bonjour ", input$nom)
  })
    
    output$le_texte <- renderText({ 
      input$curseurx*input$curseury
    })
    
    dataset <- reactive({
      get(input$dataset, "package:ggplot2")
    })
    
    output$summary <- renderPrint({
      summary(dataset())
    })
    
    output$graphe <- renderPlot({
      plot(dataset())
    },height = 620,  res = 96)
    
    output$uca<-renderImage({
      filename<-normalizePath(file.path('./images','UCA.png'))
      list(src=filename,
           contentType='image/png',
           alt="ici est une image")}, deleteFile=FALSE)

}

