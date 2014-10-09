#!/usr/bin/Rscript
# Purpose:         Responsive SVG
# Date:            2014-08-15       
# Author:          Tim Hagmann
# Data Used:       
# Packages Used:   
# Machine:         X10004122 (Win 32)
# Notes:           In order for it to work, RTools() has to be installed
# R Version:       R version 3.1.1 -- "Sock it to Me"
################################################################################

## Download init File
download.file(url="https://rawgit.com/greenore/initR/master/init.R",
              destfile="01_initialize.R", method="curl")

## Source Files
source("01_initialize.R")
source("02_load.R")

respXML <- function( svg_xml, height = NULL, width = "100%", print = T, ... ){
  # svg_xml should be an XML document
  library(htmltools)
  library(XML)
  
  svg <- structure(
    ifelse(
      length(getDefaultNamespace(svg_xml)) > 0
      ,getNodeSet(svg_xml,"//x:svg", "x")
      ,getNodeSet(svg_xml,"//svg")
    )
    ,class="XMLNodeSet"
  )
  
  xmlApply(
    svg
    ,function(s){
      a = xmlAttrs(s)
      removeAttributes(s)
      xmlAttrs(s) <- a[-(1:2)]
      xmlAttrs(s) <- c(
        style = paste0(
          "height:100%;width:100%;"
        )
      )
    }
  )
  
  svg <- HTML( saveXML( svg_xml) )
  
  svg <- tags$div(
    style = paste(
      sprintf('width:%s;',width)
      ,ifelse(!is.null(height),sprintf('height:%s;',height),"")
    )
    ,svg
  )
  
  if(print) html_print(svg) 
  
  return( invisible( svg ) )
}