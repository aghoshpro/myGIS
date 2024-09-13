library(raster)
library(rasterVis)

setwd("C://Users//ARKA GHOSH//Desktop//GeoTIFF//Anirban da//Filter//") # same folder as the ZIP-File

t1 = list.files(pattern = "tif")

for(i in 1:length(t1)){
map2 = raster(t1[i])
M = as.matrix(map2)
M[M <= M[1,1]] <- NA


map3 = raster(M)
map3@extent = extent(map2)
#map3 = projectRaster(map2, crs = crs(map2))
proj4string(map3) = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 ")

rf <- writeRaster(map3, filename=paste(strsplit(t1[i],".tif")[[1]],"_Filtered",sep=""), format="GTiff", overwrite=TRUE)

rm(map2,M,map3,rf)

print(i)
}