
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
  title = "InfoGripe v0.004"
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
  ),
    HTML('<p><b> Atualizações </p></b>
          <p>- Cálculo de rotas de todas de todos os setores até a sede municipal mais próxima - 03/07/2023</p> 
          <p>- Cáculo de rotas sentinela 1 - 05/07/2023</p>
          <p>- Uma interface foi criada - 06/07/2023</p>
          <p>- Cáculo de rotas sentinela 2 - 15/07/2023</p>
          <p>- Simplificação da malha de setores censitários - 20/07/2023</p>
          <p>- Sicronização de mapas sentinela 1 com sentinela 2 - 22/07/2023</p>
          <p>- Inclusão de camadas de UF e Região - 22/07/2023</p>')
  
  
)

dashboardPage(
  header,
  dashboardSidebar(disable = TRUE),
  body
)