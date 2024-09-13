library(raster)
library(gdalUtils)


setwd("H://MODIS NDVI//2005//")
filenames1 = list.files(pattern = "h25v06")
filenames2 = list.files(pattern = "h26v06")

shape = shapefile("Bankura_purulia.shp")
crs(shape)
path_str = "H://MODIS NDVI//2005//"
for (i in 1:length(filenames1)) {
  s1 = raster(filenames1[i])
  s2 = raster(filenames2[i])
  s = mosaic(s1,s2,fun=mean)
  s = projectRaster(s, crs ="+proj=longlat +datum=WGS84")
  r2 <- crop(s, extent(shape))
  r3 <- mask(r2, shape)
  rf <- writeRaster(r3, filename=paste(path_str,filenames1[i],sep=""), format="GTiff", overwrite=TRUE)
  rm(s1,s2,s,r2,r3,rf)
}
