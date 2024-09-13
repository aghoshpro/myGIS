library(raster)
library(rasterVis)
library(gplots)
library(maptools)
library(rgdal)
library(Cairo)
library(rgdal)
library(graphics)
library(mapproj)
#--- Colormap Libraries ----#
library(colorspace)
library(colorRamps)
library(RColorBrewer)
library(wesanderson)
library(viridis)
library(dichromat)
#----------------------------
fig = c(0,1,0,1)
dev.new()

setwd("H://Portugal Forest Fire//Source Area//MODIS//GeoTIFF//GeoTIFF Screened Output//") # same folder as the ZIP-File
t1 = list.files(pattern = ".tif$")

#---------------Custom Colorbar----------------#
cc <- brewer.pal(7,"YlOrRd")
X= c(paste("#FFFFFF"),cc)

X <- colorRampPalette(c(paste("#FFFFFF"),cc))
# display.brewer.pal(8, palette())
#-----------------------------------------------

S1 = shapefile('H:/Portugal Forest Fire/Source Area/MODIS/GeoTIFF/GeoTIFF Screened Output/Leiraat.shp')
ex = extent(S1)
I = shapefile('H:/Portugal Forest Fire/Source Area/MODIS/GeoTIFF/GeoTIFF Screened Output/Portugal.shp')
ex = extent(I)

C = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
gl <- gridlines(I)
cp.gl <- spTransform(gl, C)

Findex = c(0,1,200,400,600,800,1000,2200)
  #seq(0,1000, by = 200)
Cairo(file="GRID.png",
      type="png",
      units="px",
      bg = "white",
      width=2000,
      height=2400,
      pointsize=10,
      dpi= 100)

par(mfrow=c(5,5))

 # i = 13

for (i in 1:length(t1)) {
  
  print(i)
  
  s = strsplit(t1[i],".tif")[[1]]
  
  map2 = raster(t1[i]) #band = 1,2,3
  TWS = as.matrix(map2)
  # TWS[14,30] = NA
  # TWS[15,30] = NA
  # TWS[14,31] = NA
  # TWS[13,29] = NA
  # map2 = raster(TWS)
  # map2@extent = ex
  r <- crop(map2, extent(S1))
  r3 <- mask(r, S1)
  
  
  
  crs(S1)
  plot(r3,breaks = Findex,col=X(8),main=paste(s,""),col.axis= "red",asp = 1,cex.main = 3,cex.axis = 2,interpolate = TRUE,useRaster = TRUE)
  plot(S1,add = TRUE)
  #plot(cp.gl, add = TRUE) # Gridlines On
  
  #inferno(8,direction = -1)
  #brewer.pal(7,"PuRd")
  #wes_palette("Darjeeling2",10, type = "continuous")
}

dev.off()

print("Operation Successful")
# graphics.off()
# par("mar")
# par(mar=c(1,1,1,1))
