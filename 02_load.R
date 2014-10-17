## Load Dependencies
# Bioconductor
requiredPackages <- c('SVGAnnotation')
packagesBioconductor(requiredPackages, update=update_packages)

# CRAN
requiredPackages <- c("htmltools", "pipeR")
packagesCRAN(requiredPackages, update=update_packages)

# Github
requiredPackages <- c("leafletR")
packagesGithub(requiredPackages, repo_name="chgrl",
               proxy_url="webproxy.balgroupit.com", port=3128,
               update=update_packages)

rm(requiredPackages)
