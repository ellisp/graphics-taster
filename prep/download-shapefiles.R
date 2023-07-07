

download.file("http://www3.stats.govt.nz/digitalboundaries/annual/ESRI_Shapefile_Digital_Boundaries_2014_Generalised_Clipped.zip",
              destfile = "data/2014_boundaries.zip", mode ="wb")

unzip("data/2014_boundaries.zip", exdir = "data/shapefiles")

library(sf)

ta2014 <- st_read("data/shapefiles/2014 Digital Boundaries Generlised Clipped/TA2014_GV_Clipped.shp") |>
  st_simplify(dTolerance = 1000) |>
  filter(!grepl("Chatham", TA2014_NAM))

save(ta2014, file = "data/ta2014.rda")
