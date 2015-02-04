
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(mlxR)
library(ggplot2)
shinyServer(function(input, output) {
  Paw <- list(name='Paw',time=seq(from=0, to=40, by=0.1))
  KIN <- list(name='kin',time=seq(from=0, to=40, by=0.1))
  
  rdata <- reactive({
    pdf <- c(
                      kgrow = input$kgrow,
                      kin0 = input$kin0,
                      Imax = input$Imax,
                      Cp = input$Cp,
                      IC50 = input$IC50,
                      kout = input$kout,
                      tonset = input$tonset,
                      Rdeg = input$Rdeg,
                      Paw0 = input$Paw0)
    
    
    res <- simulx(model='abatacept', 
                  parameter=pdf, 
                  output=list(Paw, KIN))
    res
    })
  
  
  output$plot <- renderPlot({
    res <- rdata()
    p_paw <-  ggplot(data=res$Paw, aes(x=time, y=Paw)) + geom_line(size=1) +
      PKPDmisc::base_theme() + labs(list(x = "Time, days", y = "Paw Size mm^2"))
    print(p_paw)
  })
  

 # ggplot(data=res$kin, aes(x=time, y=kin, color = id)) + geom_line(size=1) + PKPDmisc::base_theme()
  
})
