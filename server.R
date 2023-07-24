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
  sent1 %>%   
    addPolylines(data = mr, color="black", fill = F,weight = 0.8,
                   stroke = T, fillOpacity = 1, group = "Região") %>% 
    addPolylines(data = uf, color="black", fill = F,weight = 0.8,
                 stroke = T, fillOpacity = 1, group = "UF") %>% 
      addMiniMap() %>% 
      addLayersControl(
        overlayGroups = c("UF", "Região"),
        options = layersControlOptions(collapsed = FALSE)
      ) %>% 
      hideGroup(c("UF", "Região"))
      
  })


  output$s2map <- renderLeaflet({
    
  sent2 
      # addLayersControl(
      #   overlayGroups = c("UF", "Região"),
      #   options = layersControlOptions(collapsed = FALSE)
      # ) %>% 
      # hideGroup(c("UF", "Região"))
  
    
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
    
    if(is.null(input$s1map_groups)){
      
      # try({
      #   leafletProxy('s2map') %>%
      #     clearGroup(group = c("UF","Região"))
      # }, silent = T)      
      return(NULL)
    }else{
      if(input$s1map_groups == "UF"){
      
        isolate({
          
          try({
            leafletProxy('s2map') %>%
              clearGroup(group = c("Região"))
          }, silent = T)
          
          leafletProxy('s2map') %>%
            setView(lng = input$s1map_center$lng, lat = input$s1map_center$lat, zoom = input$s1map_zoom) %>%
            addPolylines(data = uf, color="black", fill = F,weight = 0.8,
                         stroke = T, fillOpacity = 1, group = "UF")
        })
        
      }
      
      if(input$s1map_groups == "Região"){
        
        isolate({
          
          try({
            leafletProxy('s2map') %>%
              clearGroup(group = c("UF"))
            
          }, silent = T)

                    
          leafletProxy('s2map') %>%
            setView(lng = input$s1map_center$lng, lat = input$s1map_center$lat, zoom = input$s1map_zoom) %>%  
            addPolylines(data = mr, color="black", fill = F,weight = 0.8,
                         stroke = T, fillOpacity = 1, group = "Região")
        })
        
      }
      
    }
    
  })
  

}