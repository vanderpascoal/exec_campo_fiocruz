
library(shiny)
library(leaflet)
library(RColorBrewer)
library(sf)
library(tidyverse)
library(shinydashboard)
library(magrittr)

library(plotly)
library(ggplot2)


header <- dashboardHeader(
  title = "InfoGripe v0.003"
)

body <- dashboardBody(
  fluidRow(
    column(width = 6,
           box(width = NULL, solidHeader = TRUE,
               leafletOutput("s1map", height = 500)
              
           ),
          
    ),
    column(width = 6,
           box(width = NULL, solidHeader = TRUE,
               leafletOutput("s2map", height = 500)
               
           )
    
    )
  )
)

dashboardPage(
  header,
  dashboardSidebar(disable = TRUE),
  body
)