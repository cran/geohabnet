## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
#  if (!require("devtools")) {
#    install.packages("devtools")
#  }

## ----setup, eval=FALSE--------------------------------------------------------
#  
#  library("devtools")
#  
#  if (!require("geohabnet")) {
#    install_github("GarrettLab/CroplandConnectivity", subdir = "geohabnet")
#  }

## ----message=FALSE------------------------------------------------------------
library(geohabnet)

## ----message=FALSE------------------------------------------------------------
?geohabnet
# and
?geohabnet::sean # any function

## ----message=FALSE------------------------------------------------------------
sensitivity_analysis()

## ----message=FALSE------------------------------------------------------------
avocado <- cropharvest_rast("avocado", "monfreda")

# verify the raster object
avocado
terra::plot(avocado)

## ----message=FALSE------------------------------------------------------------
risk_indexes <- sean(avocado)

## -----------------------------------------------------------------------------
global_scales()

## -----------------------------------------------------------------------------
#set_global_scales(list(east = c(-24, 180, -58, 60), west = c(-140, -34, -58, 60)))

## -----------------------------------------------------------------------------
config_file <- get_parameters(out_path = tempdir())
config_file

## -----------------------------------------------------------------------------
set_parameters(new_params = config_file)
#using iwindow = true will prompt a selction window to choose config file.

## -----------------------------------------------------------------------------
geohabnet::get_supported_sources()

## -----------------------------------------------------------------------------
search_crop("avocado") #1
search_crop("banana") #2

## -----------------------------------------------------------------------------
# get avocado data
rast_avocado <- crops_rast(list(monfreda = "avocado"))

#get data of banana crop
rast_ban <- crops_rast(list(mapspam = "banana"))

## -----------------------------------------------------------------------------
rast_avo_ban <- crops_rast(list(monfreda = c("avocado", "banana"), mapspam = c("banana")))

## -----------------------------------------------------------------------------
results <- lapply(list(rast_avocado, rast_ban, rast_avo_ban), terra::rast)

## ----eval = FALSE, message=FALSE----------------------------------------------
#  results <- lapply(list(rast_avocado, rast_ban, rast_avo_ban), sean)

## ----message=FALSE------------------------------------------------------------
results <- sensitivity_analysis()

## ----message=FALSE------------------------------------------------------------
risk_indexes <- sean(avocado, host_density_threshold = 0.00001, link_threshold = 0.00001)

## -----------------------------------------------------------------------------
dist_methods()

## -----------------------------------------------------------------------------
supported_metrics()

## ----non-global, message=FALSE------------------------------------------------
results <- sean(avocado, global = FALSE, geoscale = c(-115, -75, 5, 32))

## ----message=FALSE------------------------------------------------------------
risk_indexes <- sean(avocado)
connectivity(risk_indexes)

