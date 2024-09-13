library(raster)
library(rasterVis)
library(ggplot2)
library(gplots)
library(maptools)
library(rgdal)
library(RColorBrewer)
library(Cairo)
library(colorspace)
library(colorRamps)
library(rgdal)
library(ncdf4)
library(data.table)

#setwd("C://Users//ARKA GHOSH//Downloads//ORDER_ghosha_7942//DA_TC_JASON1_GDR_NETCDF//")
setwd("H:/TOTAL_INDIA_SCALED_DATA/New folder//")
ncfname = list.files(pattern = ".nc")
# xy = vector()
I = shapefile('C:/Users/ARKA GHOSH/Desktop/Hudson/Hudson_Bay.shp')
#S = shapefile('H:/TOTAL_INDIA_SCALED_DATA/New folder/coastlines.shp')
ex = extent(I)
crs(I)

for(k in 1:length(ncfname)){
  #k=1
  t = ncfname[k]
  
  # open a NetCDF file
  v = stack(ncfname[k],varname="CanopInt_inst")@layers[[1]]
  r <- crop(v, extent(I))
  r3 <- mask(r, I)
  rf <- writeRaster(r3, filename=paste(k,"_Canopy",sep=""), format="GTiff", overwrite=TRUE)
  
  rm(r,r3)
  
  v1 = stack(ncfname[k],varname="Wind_f_inst")@layers[[1]]
  r <- crop(v1, extent(I))
  r3 <- mask(r, I)
  rf <- writeRaster(r3, filename=paste(k,"_Wind",sep=""), format="GTiff", overwrite=TRUE)
  
  # # Reading Long & Lat from nc file --------------------------------------------------
  # Long <- ncvar_get(nc, varid = "lon")
  # Lat <- ncvar_get(nc, varid = "lat")
  print(k)
}