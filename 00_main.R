#!/usr/bin/Rscript
# Purpose:         HTML Experiments
# Date:            2014-10-10
# Author:          http://timelyportfolio.blogspot.com, Tim Hagmann
# Machine:         X10004122 (Win 32)
# Notes:           WINDOWS: In order for it to work, RTools() has to be installed
# R Version:       R version 3.1.1 -- "Sock it to Me"
################################################################################

## Download init File
download.file(url="https://rawgit.com/greenore/initR/master/init.R",
              destfile="01_init.R", method="wget")

## Source File
update_packages <- FALSE
source("01_init.R")
source("02_load.R")
source("03_responsiveSVG.R")
source("04_rCSS.R")
