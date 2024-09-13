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

setwd("C://Users//ARKA GHOSH//Desktop//PHD//Stockholm University//Interview//OMI//") # same folder as the ZIP-File
t1 = list.files(pattern = ".tif$")

#---------------Custom Colorbar----------------#
cc <- brewer.pal(7,"YlOrRd")
X= c(paste("#FFFFFF"),cc)

X <- colorRampPalette(c(paste("#FFFFFF"),cc))
# display.brewer.pal(8, palette())
#-----------------------------------------------

S1 = shapefile('C:/Users/ARKA GHOSH/Desktop/PHD/Stockholm University/Interview/Portugal.shp')
ex = extent(S1)
ex_custom = extent(c(-9.547082, -6.189142, 37, 42.2))
C = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")
# gl <- gridlines(I)
# cp.gl <- spTransform(gl, C)

Findex = c(0,1,200,400,600,800,1000,2200)
Cindex = c(0,0.5,1,1.5,2,2.5,3,3.5,4)
  #seq(0,1000, by = 200)
Cairo(file="GRID_legend.png",
      type="png",
      units="px",
      bg = "white",
      width=2500,
      height=1900,
      pointsize=10,
      dpi= 200)

par(mfrow=c(2,4))

 # i = 13

for (i in 1:length(t1)) {
  
  print(i)
  
  s = strsplit(t1[i],"_")[[1]]
  s1 = strsplit(s[3], "m")[[1]]
  yyyy = strsplit(s[3], "m")[[1]][1]
  m1 = strsplit(s1[2],"")[[1]]
  mm = paste(m1[1],m1[2],sep="")
  dd = paste(m1[3],m1[4],sep="")
  
  date = paste(dd,mm,yyyy,sep="-")
  
  map2 = raster(t1[i]) #band = 1,2,3
  TWS = as.matrix(map2)
  # TWS[14,30] = NA
  # TWS[15,30] = NA
  # TWS[14,31] = NA
  # TWS[13,29] = NA
  # map2 = raster(TWS)
  # map2@extent = ex
  r <- crop(map2, ex_custom)
  r3 <- mask(r, S1)
  
  
  
  crs(S1)
  plot(r3,breaks = Cindex,col=X(8),main=paste(date,""),col.axis= "red",asp = 1,cex.main = 3,cex.axis = 2,interpolate = TRUE,useRaster = TRUE,  legend = FALSE)
  plot(S1,add = TRUE)
  #plot(cp.gl, add = TRUE) # Gridlines On
  
  #inferno(8,direction = -1)
  #brewer.pal(7,"PuRd")
  #wes_palette("Darjeeling2",10, type = "continuous")
}

plot(
  r3,
  legend.only = TRUE,
  breaks = Cindex,
  col=X(8),
  legend.width = 5,
  legend.height = 20,
  legend.shrink = 1,
  horiz = TRUE,
  xjust = 1,
  text.width = 2,
  axis.args = list(cex.axis = 3, font = 3),
  legend.args = list(
    text = '',
    side = 3,
    font = 2,
    line = -8,
    cex = 2
  )
)

dev.off()

print("Operation Successful")
# graphics.off()
# par("mar")
# par(mar=c(1,1,1,1))

