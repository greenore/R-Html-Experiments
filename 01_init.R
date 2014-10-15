#!/usr/bin/Rscript
# Purpose:         Small initialization script
# Date:            2014-10-09
# Author:          Tim Hagmann
# Data Used:       
# Packages Used:   devtools, httr
# Machine:         X10004328 (Win 32)
# Notes:
# R Version:       R version 3.1.1 -- "Sock it to Me"
################################################################################

## Helper Functions
# Function to load libraries
loadLibraries <- function(requiredPackages){
  for(i in seq_along(requiredPackages)){
    library(requiredPackages[i], character.only=TRUE)
  }
}

# Function to install and/or load packages from CRAN 
packagesCRAN <- function(requiredPackages, update=F){
  missingPackages <- requiredPackages[!(requiredPackages %in% installed.packages()[ ,"Package"])]
  
  if(length(missingPackages) > 0 || update){
    if(update){missingPackages <- requiredPackages} # Base (required)
    install.packages(missingPackages)
  }
  
  loadLibraries(requiredPackages)
}

# Function to install and/or load missing packages from Bioconductor 
packagesBioconductor <- function(requiredPackages, update=F){
  missingPackages <- requiredPackages[!(requiredPackages %in% installed.packages()[ ,"Package"])]
  
  if(length(missingPackages) > 0 || update){
    if(update){missingPackages <- requiredPackages} # Base (required)
    dir.create("tmp")
    download.file(url="https://rawgit.com/greenore/initR/master/biocLite.R",
                  destfile="tmp/biocLite.R", method="wget")
    source("tmp/biocLite.R")
    unlink("tmp", recursive=TRUE)
    biocLite(missingPackages)
  }
  
  loadLibraries(requiredPackages)
}

# Function to install and/or load missing packages from Github 
packagesGithub <- function(requiredPackages, repoName, authToken=NULL, 
                           proxyUrl=NULL, port=NULL,
                           update=F){
  packagesCRAN("devtools")
  
  missingPackages <- requiredPackages[!(requiredPackages %in% installed.packages()[ ,"Package"])]
  
  if(length(missingPackages) > 0 || update){
    setProxy(proxyUrl=proxyUrl, port=port)
    missingPackages <- paste0(repoName, '/', missingPackages)    # Base (missing)
    
    if(update) {
      missingPackages <- paste0(repoName, '/', requiredPackages) # Base (required)
    }
    
    for(i in seq_along(missingPackages)){
      install_github(repo=missingPackages[i], auth_token=authToken)
    }    
  }
  
  loadLibraries(requiredPackages)
}

# Function to ping a server (i.e., does the server exist)
pingServer <- function(url, stderr=F, stdout=F, ...){
  vec <- suppressWarnings(system2("ping", url, stderr=stderr, stdout=stdout, ...))
  if (vec == 0){TRUE} else {FALSE}
}

setProxy <- function(proxyUrl, port){
  packagesCRAN("httr")
  
  port <- as.numeric(port)
  
  if(pingServer(proxyUrl)){
    usr <- readline("Bitte Benutzername eingeben: ")
    pwd <- readline("Bitte Passwort eingeben: ")
    cat("\14")
    
    reset_config()
    set_config(use_proxy(url=proxyUrl, port=port, username=usr, password=pwd))
  }
}