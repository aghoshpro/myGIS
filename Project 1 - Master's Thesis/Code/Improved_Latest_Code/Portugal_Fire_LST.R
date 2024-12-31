library(raster)
library(rasterVis)
library(gplots)
library(maptools)
library(rgdal)
library(Cairo)
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

#setwd("H://Portugal Forest Fire//Source Area//MODIS//GeoTIFF//GeoTIFF Screened Output//") # same folder as the ZIP-File
setwd("C://Users//ARKA GHOSH//Desktop//PHD//Stockholm University//Interview//MODIS_LST//Night//") # same folder as the ZIP-File

t1 = list.files(pattern = "aid0001.tif$")

a = matrix(0, nrow=length(t1), ncol=2) 
#array(0,dim =length(t1))


#---------------Custom Colorbar----------------#
cc <- brewer.pal(7,"YlOrRd")
X= c(paste("#FFFFFF"),cc)

X <- colorRampPalette(c(paste("#FFFFFF"),cc))
# display.brewer.pal(8, palette())
#-----------------------------------------------

S1 = shapefile('C:/Users/ARKA GHOSH/Desktop/PHD/Stockholm University/Interview/Portugal.shp')
ex = extent(S1)
ex_custom = extent(c(-9.547082, -6.189142, 36.96097, 42.29554))
C = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
# gl <- gridlines(I)
# cp.gl <- spTransform(gl, C)

# Findex = c(0,1,200,400,600,800,1000,2200)
Cindex = c(-10,-5,0,5,10,15,20,25,30,35,40)
#seq(0,1000, by = 200)

Cairo(file="GRID_Portugal_Terra_LST_Night_4444.png",
      type="png",
      units="px",
      bg = "white",
      width=2400,
      height=1200,
      pointsize=10,
      dpi= 100)

par(mfrow=c(3,10))
i = 1
for (i in 1:length(t1)) {
  
  s = strsplit(t1[i],"_")[[1]]
  s1 = strsplit(s[3], "m")[[1]]
  date = as.Date(as.numeric(substr(s[5], 8, 10))-1, origin = "2017-01-01")
  date = format(as.Date(date), "%d-%m-%Y")
  
  map2 = raster(t1[i]) #band = 1,2,3
  map_normal = as.matrix(map2)

  #----- K to C --------------------------------------
  map_normal= map_normal * 0.02   #Scale Factor 0.02
  map_normal= map_normal - 273.15
  #---------------------------------------------------
  map_ras = raster(map_normal)
  map_ras@extent = map2@extent
  proj4string(map_ras) = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 ")
  #---------------------------------------------------
  
  r <- crop(map_ras, ex_custom)
  r3 <- mask(r, S1)
  
  plot(r3,breaks = Cindex,col=blue2red(10),zlim = c(-10, 40),main=paste(date,""),col.axis= "black",asp = 1,cex.main = 3,cex.axis = 2,interpolate = TRUE,useRaster = TRUE, legend = FALSE)
  plot(S1,lwd = 2, add = TRUE)
  #plot(cp.gl, add = TRUE) # Gridlines On
  
  #inferno(8,direction = -1)
  #brewer.pal(7,"PuRd")
  #wes_palette("Darjeeling2",10, type = "continuous")
  a[i,1] = date
  #a[i,2] = mean(map_normal, na.rm=TRUE)
  a[i,2] = sd(map_normal, na.rm=TRUE)
  print(i)
}

dev.off()
write.csv(a,"Terra_LST_Night_0001.csv", row.names = FALSE, col.names = F)

print("Operation Successful")
# graphics.off()
# par("mar")
# par(mar=c(1,1,1,1))

