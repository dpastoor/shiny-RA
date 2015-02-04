
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("RA modeling"),
  fluidPage(
             fluidRow(
               column(3,
                      tabsetPanel(
                        tabPanel("P1",
                                 br(),
                                 #sliderInput("id", "id", value =  1, min = 0, max = 2, step = 1),
                                 sliderInput("kgrow", "kgrow", value =  0.52, min = 0, max = 3, step = 0.05),
                                 sliderInput("kin0", "kin0", value =  18.6, min = 0, max = 40, step = 0.5),
                                 sliderInput("Rdeg", "Rdeg", value =  0.128, min = 0, max = 2, step = 0.02),
                                 sliderInput("Paw0", "Paw0", value = 55.4, min = 40, max = 100, step = 5),
                                 sliderInput("kout", "kout", value =  0.221, min = 0, max = 1, step = 0.02),
                                 
                                 br()
                        ),
                        tabPanel("P2",
                                 br(),
                                 sliderInput("Imax", "Imax", value =  0.289, min = 0, max = 1, step = 0.02),
                                 sliderInput("Cp", "Cp", value =  0, min = 0, max = 1, step = 0.1),
                                 sliderInput("IC50", "IC50", value =  22.7, min = 0, max = 100, step = 10),
                                 
                                 #sliderInput("id", "id", value =  1, min = 0, max = 2, step = 1),
                                 sliderInput("tonset", "tonset", value =  14.5, min = 0, max = 30, step = 0.5),
                              
                                 br()
                        )
                      )),
               column(9,
                      plotOutput("plot"))
             )
  )
))
