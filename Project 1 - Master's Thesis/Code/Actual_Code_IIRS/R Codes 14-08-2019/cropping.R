library(raster)
library(rgdal)
library(maptools)

setwd("C://Users//ARKA GHOSH//Desktop//Papers//2//World TWS")
t = list.files(pattern = "tif")

getCroppedData <- function(TiffFile,shapeFile)#band
{
  x <- shapefile(shapeFile)
  crs(x)
   
  r2 <- crop(raster(TiffFile), extent(x))#,band
  r3 <- mask(r2, x)
  return(r3)
}
for (i in 1:length(t)) {
print(i)  
t1 = getCroppedData(t[i],"India.shp")
rf <- writeRaster(t1, filename=paste(t[i],"_India_cropped",sep=""), format="GTiff", overwrite=TRUE)
}