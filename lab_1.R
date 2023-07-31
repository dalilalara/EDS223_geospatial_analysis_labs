# EDS 223 Lab 1 

#loading in libaries
# package not available for this version of R go to the packages github and install from code provided (select all)
library(sf)
library(raster)
library(dplyr)
library(spData)
library(spDataLarge)
library(tmap)

#load spatial data (vector data)
head(nz)

#building maps using tmap package
tm_shape(nz) +
  tm_fill()

#map w/borders and fill
tm_shape(nz) +
  tm_fill() +
  tm_borders()

#store maps as objects
#polygons both provides borders and fill
map_nz <- tm_shape(nz) +
  tm_polygons()
class(map_nz)
map_nz

#Raster data nz_elevation
    #nz_elev
    
map_nz1 <- map_nz +
  tm_shape(nz_elev) +
  tm_raster(alpha = 0.7)

#Vector data set nz_height
#adding spatial object to map_nz1
map_nz1 +
  tm_shape(nz_height) +
  tm_dots()

#aesthetics in tmap colors, borders width, line type
      #alpha = transcperency
tm_shape(nz) +
  tm_fill(col = "red",
          alpha = 0.3) +
  tm_borders(col = "blue",
             lwd = 3,
             lty = 2)

tm_shape(nz) +
  tm_borders(col = "blue",
             lwd = 3,
             lty = 2)

      #aesthetics based on variables 
legend_title <- expression("Area (km"^2*")")
tm_shape(nz) +
  tm_fill(col = "Land_area",
          title = legend_title) +
  tm_borders()

      #style breaks the legend #'s equal, quantile, tmap resource on github provides more aes options
      #?tm_polygons provides all options
tm_shape(nz) +
  tm_polygons(col = "Median_income",
              style = "quantile")

    #breaks
break_1 <- c(0, 3, 4, 5)*10000
tm_shape(nz)+
  tm_polygons(col = "Meadian_income", 
              breaks = break_1)
              
map_nz +
  tm_shape(nz_elev) +
  tm_raster(alpha = 0.7,
            style = "cont")

map_nz +
  tm_shape(nz) +
  tm_polygons(col = "Island",
              style = "cat")

#Map layout --> compass, scale bar, graticules, background color
map_nz +
  tm_compass(type = "4star",
             position = c("left", "top")) +
  tm_scale_bar(breaks = c(0, 100, 200))

map_nz +
  tm_graticules() +
  tm_layout(bg.color = "lightblue")

#viewing in interactive mode
tmap_mode("view")
map_nz

tmap_mode("plot")


