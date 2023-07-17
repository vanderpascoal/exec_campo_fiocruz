library(shiny)

library(leaflet)
library(mapdeck)

library(RColorBrewer)
library(sf)
library(tidyverse)
library(shinydashboard)

library(plotly)
library(ggplot2)
library(magrittr)


source("/home/pascoal/Documentos/fv_infogripe/app/app/Global.R")


function(input, output, session) {
  
  output$s1map <- renderLeaflet({
  sent1   
  })


  output$s2map <- renderLeaflet({
  sent2 
  })
  

  observe({
  
    #Values:    s1map_bounds, s1map_center, s1map_click, s1map_shape_click, s1map_shape_mouseout, s1map_shape_mouseover, s1map_zoom, s2map_bounds, s2map_center, s2map_zoom, sidebarCollapsed, sidebarItemExpanded, zoomButton 
    
    if (all(input$s1map_center$lat==input$s2map_center$lat,
            input$s1map_center$lng==input$s2map_center$lng,
            input$s1map_zoom==input$s2map_zoom)){
      
      return(NULL)
    }else{
      
        isolate({
          leafletProxy('s2map') %>%
            setView(lng = input$s1map_center$lng, lat = input$s1map_center$lat, zoom = input$s1map_zoom)
        })
        
    }
  })
  

}