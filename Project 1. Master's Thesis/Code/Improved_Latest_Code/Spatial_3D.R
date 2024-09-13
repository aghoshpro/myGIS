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


setwd("C://Users//ARKA GHOSH//Desktop//PHD//Stockholm University//Interview//MODIS_LST//3D//") # same folder as the ZIP-File
S1 = shapefile('C:/Users/ARKA GHOSH/Desktop/PHD/Stockholm University/Interview/Leiraat.shp')
ex = extent(S1)

D = list.files(pattern = "D.tif$")
N = list.files(pattern = "N.tif$")
dev.new()
Cairo(file=paste("_","Leiraat",".png"),
      type="png",
      units="px",
      bg = "white",
      width=2400,
      height=1200,
      pointsize=10,
      dpi= 100)

# i = 26
par(mfrow=c(3,10))
for (i in 1:length(N)) {
s = strsplit(N[i],"_")[[1]]
#date = as.Date(as.numeric(substr(s[5], 8, 10))-1, origin = "2017-01-01")
date = format(as.Date(s[1]), "%d-%m-%Y")
Cindex = c(-10,-5,0,5,10,15,20,25,30,35,40)

# dev.new()
# Cairo(file=paste(date,"_","Leiraat",".png"),
#       type="png",
#       units="px",
#       bg = "white",
#       width=2000,
#       height=2400,
#       pointsize=10,
#       dpi= 300)

map2 =  (raster(N[i]))
         
map_N =  as.matrix(raster(N[i]))
map_D =  as.matrix(raster(D[i]))

#----- K to C --------------------------------------
map_N = map_N * 0.02   #Scale Factor 0.02
map_N = map_N - 273.15
map_D = map_D * 0.02   #Scale Factor 0.02
map_D = map_D - 273.15
#---------------------------------------------------

#--------- Mean of 3D Matrix -----------------------
DN = array(0, dim = c(nrow(map_N),ncol(map_N),2))

DN[,,1] =  map_N
DN[,,2] =  map_D

DN_mean = rowMeans(DN, dims = 2, na.rm= TRUE)

map_ras = raster(DN_mean)
map_ras@extent = map2@extent
proj4string(map_ras) = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0 ")
#---------------------------------------------------

r <- crop(map_ras, ex)
r3 <- mask(r, S1)

plot(r3,breaks = Cindex,col=blue2red(10),zlim = c(-10, 40),main=paste(date,""),col.axis= "black",asp = 1,cex.main = 3,cex.axis = 2,interpolate = TRUE,useRaster = TRUE, legend = FALSE)
plot(S1,lwd = 2, add = TRUE)


print(i)

#dev.off()
}

dev.off()
print("Operation Successful")