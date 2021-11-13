  

# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

if ("BiocManager" %in% rownames(installed.packages()))
  remove.packages("BiocManager")

install.packages("BiocManager", repos="https://cran.rstudio.com")
#install.packages("devtools", repos="https://cran.rstudio.com")
#devtools::install_github("Bioconductor/BiocManager")
library(BiocManager)

if(BiocManager::version() != "3.14"){
  BiocManager::install(version="3.14",
                       update=TRUE, ask=FALSE)
}


std_pkgs <- c(
  "devtools", "edgeR",
  "ggpubr", "MAST", 
  "plyr", "Rtsne", 
  "scales", "scater", "SingleCellExperiment",
  "Cepo", "slingshot" , "UpSetR", 
  "scran", "tidyverse", 
  "viridis", "monocle",
  "ggthemes",  "ggridges", "reshape2" , "ggpubr", 
  "DT", 
  "DescTools")

gh_pkgs <- c("MarioniLab/DropletUtils",
             "SydneyBioX/scdney",
             "SydneyBioX/scMerge",
             "SydneyBioX/scClassify")

builtins <- c(std_pkgs, gh_pkgs)

for (builtin in builtins)
  if (!suppressWarnings(require(builtin, character.only=TRUE)))
    suppressWarnings(BiocManager::install(builtin,
                                          version="3.14",
                                          update=TRUE, ask=FALSE))
