#!/usr/bin/Rscript
# Purpose:         HTML Experiments
# Date:            2014-10-10
# Author:          http://timelyportfolio.blogspot.com, Tim Hagmann
# Notes:           WINDOWS: In order for it to work, RTools() has to be installed
# R Version:       R version 3.1.1 -- "Sock it to Me"
################################################################################

## Download init File (with helper functions)
download.file(url="https://rawgit.com/greenore/initR/master/init.R",
              destfile="01_init.R",
              method=ifelse(Sys.info()["sysname"][[1]] == "Linux", "wget", "auto"))

## Source File
update_packages <- FALSE
source("01_init.R")
source("02_load.R")
source("03_responsiveSVG.R")
source("04_rCSS.R")
source("05_leafletR.R")
