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

## Start session
# pJS <- phantom()
startServer(); Sys.sleep(2)

# remDr <- remoteDriver(browserName="internet explorer")
# remDr <- remoteDriver(browserName="phantomjs")
# remDr <- firefoxDriver(useProfile=T, profileName="selenium")
remDr <- chromeDriver(useProfile=T, profileName="selenium", internalTesting=T)
remDr$open(); remDr$maxWindowSize()

## Load Data
df.path <- 'data_output/comparis_cantons.csv'
index <- 1:400

df <- read.csv2(df.path, sep = ';', header = T, stringsAsFactors = F, encoding = 'latin1')
i <- index[1]

# Unhide
unhideVersName <- FALSE
unhideTableVersName <- FALSE

## Run Program
for(i in index){
  print('--------------------------------------')
  print(paste('Run profil nr.', i))
  
  remDr$deleteAllCookies()
  source('prog_provider/comparis2/00_functions.R')
  source('prog_provider/comparis2/01_data_cleanup.R')
  source('prog_provider/comparis2/02_fill_car.R')
  source('prog_provider/comparis2/03_fill_driver.R')
  source('prog_provider/comparis2/04_fill_coverage.R')
  source('prog_provider/comparis2/05_read_table.R')
}

remDr$close()
remDr$closeServer()
