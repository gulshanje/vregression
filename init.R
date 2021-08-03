# # init.R
# #
# # Example R code to install packages if not already installed
# #
# 
my_packages = c('shiny','dplyr','DT','data.table','shinythemes','readxl','openxlsx','datasets','shinydashboard','ggplot2','tidyr','devtools')

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))


# for (package in c('shiny','DT','data.table','shinythemes','readxl','openxlsx','datasets','shinydashboard','ggplot2','tidyr','devtools',
#                   'lubridate')) {
#   if (!require(package, character.only=T, quietly=T)) {
#     install.packages(package,repos="http://cran.us.r-project.org")
#     library(package, character.only=T)
#   }
# }
