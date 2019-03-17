

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
    ),
    tabPanel(
      title='HELP:',
      mainPanel(
        tags$h1('Instructions:'),
        tags$h4('Jose Luis Cabrera Alarcon'),
        tags$h6('2019-03-16'),
        tags$p('This app is a web interface for VSRFM/VSRFM-s scores calculation, to aid in variant prioritization.'),
        tags$p('1. Click on “VSRFM” or “VSRFM-s” to select the score to calculate.'),
        img(src="options.jpg", width="700", height="500"),
        tags$p('2. Click on “browser" to upload variants data.'),
        img(src="browse.jpg", width="700", height="500"),
        tags$p('Uploaded data must be in tab separated values with ".tsv" or ".txt" extesion. For VSRFM must contain the following variables under these exact headers:'),
        tags$p(style="color:red",'gnomAD_AF'),
        tags$p(style="color:red",'CADD_PHRED'),
        tags$p(style="color:red",'Condel'),
        tags$p(style="color:red",'DANN_score'),
        tags$p(style="color:red",'MetaLR_score'),
        tags$p(style="color:red",'MetaSVM_score'),
        tags$p(style="color:red",'REVEL_score'),
        tags$p(style="color:red",'phastCons100way_vertebrate'),
        tags$p(style="color:red",'phastCons20way_mammalian'),
        tags$p(style="color:red",'phyloP100way_vertebrate'),
        tags$p(style="color:red",'phyloP20way_mammalian'),
        tags$p('For VSRFMs, in addition to the above variables, must contain:'),
        tags$p(style="color:red",'ada_score'),
        tags$p(style="color:red",'rf_score'),
        tags$p('You can change the purpose cutoff value to clasify variants in benign or pathogenic:'),
        img(src="cutoff.jpg", width="700", height="500"),
        tags$p('Hit “Download data” to save the results table to a csv file:'),
        img(src="download.jpg", width="700", height="500"))
      
      ),
  tabPanel(
    title='ABOUT:',
    tags$h1('Authors:'),
    tags$p('José Luis Cabrera Alarcón (jlcabreraa@cnic.es)'),
    tags$p('Jorge García Martínez'),
    tags$p('Fatima Sanchez Cabo'),
    
    tags$h4('Powered by R Shiny.')))
  )
)