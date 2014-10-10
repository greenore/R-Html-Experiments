## Load Dependencies
# Bioconductor
requiredPackages <- c('SVGAnnotation')
packagesBioconductor(requiredPackages, update=F)

# CRAN
requiredPackages <- c("htmltools", "pipeR")
packagesCRAN(requiredPackages, update=F)
