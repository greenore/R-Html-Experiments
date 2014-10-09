## Load Dependencies
# Bioconductor
requiredPackages <- c('SVGAnnotation')
packagesBioconductor(requiredPackages, update=F)

# CRAN
requiredPackages <- c("htmltools")
packagesCRAN(requiredPackages, update=F)

rm(list = ls())
