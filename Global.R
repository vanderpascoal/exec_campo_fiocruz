
load("/home/pascoal/Documentos/fv_infogripe/app/app/Data.RData")

library(shiny)

library(leaflet)

library(RColorBrewer)
library(sf)
library(tidyverse)
library(shinydashboard)
library(magrittr)

library(plotly)
library(ggplot2)

# Default view location



sent1<-leaflet(sent1) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 1,
              color = ~factpal1(ct_s1)) %>%
  addLegend(pal = factpal1, values = ~ct_s1, title = "Sentinelas 1 - Tempo por rota<br>
            Protocolo pré-pandemia",
            opacity = 1) %>%
  addMarkers(res1$destin_x, res1$destin_y,popup = ~as.character(res1$NM_MUN),
             label = ~as.character(res1$NM_MUN),
             clusterOptions = markerClusterOptions())



sent2 <- leaflet(sent2, options = leafletOptions(zoomControl = FALSE)) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.2, fillOpacity = 1,
              color = ~factpal2(ct_s2)) %>%
  addLegend(pal = factpal2, values = ~ct_s2, title = "Sentinela 2 - Tempo por rota<br>
            Sentinelas no polo populacional<br>
            de cada macrorregional de saúde<br>",
            opacity = 1) %>%
  addMarkers(res2$destin_x, res2$destin_y,popup = ~as.character(res2$NM_MUN),
             label = ~as.character(res2$NM_MUN),
             clusterOptions = markerClusterOptions())
