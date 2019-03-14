

##############################
# Author: Cabrera-Alarcon JL #
##############################

library(shiny)
library(shinyFiles)
options(shiny.maxRequestSize=1000*1024^2)
shinyUI(fluidPage(
  titlePanel("VSRFM v1.0"),
  navbarPage(
    title='Option:',
    tabPanel(
      title='VSRFM:',
        sidebarPanel(fileInput("file", "Input file",
                  accept = c(
                    ".tsv",
                    ".txt")),
        sliderInput("VSRFM_thres", "VSRFM cutoff:",
                  min = 0.00, max = 1.00,
                  value = 0.443),
        downloadButton("VSRFM.list.Download", "Download data")),
        mainPanel(
          verbatimTextOutput("title.VSRFM"),
          plotOutput("plot01")),
        mainPanel(
          HTML("<br><br>"), 
          verbatimTextOutput("VSRFM"),
          dataTableOutput("Data.table"))
      ),
    tabPanel(
      title='VSRFM-s:',
      sidebarPanel(fileInput("file2", "Input file",
                             accept = c(
                               ".tsv",
                               ".txt")),
                   sliderInput("VSRFMs_thres", "VSRFM-s cutoff:",
                               min = 0.00, max = 1.00,
                               value = 0.355),
                   downloadButton("VSRFMs.list.Download", "Download data")),
      mainPanel(
        verbatimTextOutput("title.VSRFMs"),
        plotOutput("plot02")),
      mainPanel(
        HTML("<br><br>"), 
        verbatimTextOutput("VSRFMs"),
        dataTableOutput("Data.table2"))
    )
    )
  )
)