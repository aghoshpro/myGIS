library(raster)
library(rgdal)
library(maptools)

setwd("C://Users//ARKA GHOSH//Desktop//PHD//Stockholm University//Interview//OMI_UV//VIS//") # same folder as the ZIP-File

t = list.files(pattern = ".tif$")

getCroppedData <- function(TiffFile,shapeFile)#band
{
  x <- shapefile(shapeFile)
  crs(x)
   
  r2 <- crop(raster(TiffFile), extent(x))#,band
  r3 <- mask(r2, x)
  return(r3)
}

for (i in 1:length(t)) {
  
# ---- Portugal ---- #
# s = strsplit(t[i],"_")[[1]]
# ss = strsplit(s[2],".", fixed=TRUE)[[1]]
# date = as.Date(as.numeric(substr(ss[2], 6, 8))-1, origin = "2017-01-01")

# # ---- Leiraat ---- #
# s = strsplit(t[i],"_")[[1]]
# date = as.Date(as.numeric(substr(s[5], 8, 10))-1, origin = "2017-01-01")
s = strsplit(t[i],"_")[[1]]
date = paste(substr(s[3], 8, 9),"-06-2017", sep = "")
  
t1 = getCroppedData(t[i],"C:/Users/ARKA GHOSH/Desktop/PHD/Stockholm University/Interview/Leiraat.shp")
rf <- writeRaster(t1, filename=paste(date,"_cropped_VIS",sep=""), format="GTiff", overwrite=TRUE)
print(i) 
}