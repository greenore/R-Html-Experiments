## Load Dependencies
# Bioconductor
requiredPackages <- c('SVGAnnotation')
packagesBioconductor(requiredPackages, update=update_packages)

# CRAN
requiredPackages <- c("htmltools", "pipeR")
packagesCRAN(requiredPackages, update=update_packages)

rm(list=ls())
