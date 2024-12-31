library(raster)
library(rasterVis)
library(gplots)
library(maptools)
library(rgdal)
library(RColorBrewer)
library(Cairo)
library(colorspace)
library(colorRamps)
library(graphics)
library(xlsx)
library(viridis)

dev.new()

setwd("C://Users//ARKA GHOSH//Desktop//Papers//2//Ganga//SMSC//") # same folder as the ZIP-File
#etwd("C://Users//ARKA GHOSH//Desktop//Project 2//Bay of Bengal//SSTA//Output//")
#setwd("C://Users//ARKA GHOSH//Desktop//Project 2//Arabian Sea//Output//")
#setwd("C://Users//ARKA GHOSH//Desktop//Project 2//Medi Sea//SSTA//Output//")
#setwd("C://Users//ARKA GHOSH//Desktop//Project 2//Slope//")
t1 = list.files(pattern = "tif")

#dFol <- "C:/Users/ARKA GHOSH/Desktop/Papers/JU Project/"
#---------------Custom Colorbar----------------#
cc <- brewer.pal(7,"Blues")
X= c(paste("#B2182B"),cc)
X <- colorRampPalette(c(paste("#B2182B"),cc))
# display.brewer.pal(8, palette())
#-----------------------------------------------

year <- array(0,dim =length(t1))
a1 = year
a2 = a1;
#S1 = shapefile('H:/All Shape Files/Arabian Sea/Arabian_Sea.shp')
#S1 = shapefile('H:/All Shape Files/Bay_Of_Bengal/Bay_of_Bengal.shp')
#S1 = shapefile('H:/All Shape Files/Mediterranean_Sea/Mediterranean_Sea.shp')
S1 = shapefile('C:/Users/ARKA GHOSH/Desktop/Papers/2/World Rainfall/Ganga_basin.shp')
ex = extent(S1)
# cuts = c(-0.8,-0.7,-0.6,-0.5,-0.4,-0.3,-0.2,-0.1,0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8);
# cut = c(-0.8,-0.5,)
#jpeg("TestGWS17.jpeg", width = 1200, height = 960, units = 'px',quality = 100)
Cairo(file="Ganda_SMS.png",
      type="png",
      units="px",
      bg = "white",
      width=3000,
      height=1920,
      pointsize=10,
      dpi= 150)

par(mfrow=c(4,4) ,oma=c(1,1,1,7), pty = "m") #c(bottom, left, top, right) #Frame Size manipualtion of 16 figures

for(i in 1:length(t1)) {
  print(i)
  s = strsplit(t1[i],"_")[[1]]
  s1 = strsplit(s[6],".t")[[1]]

  map2 = raster(t1[i]) #band = 1,2,3
  mapX = raster(t1[2]) 
  TWS = as.matrix(map2);
  # TWS[14,30] = NA
  # TWS[15,30] = NA
  #X = extent(c(0, 36.21573, 30.06809, 45.80891))
  # map2 = raster(TWS)
  map2@extent = ex
  #print(map2@data@max)
  
  #------------- Normalization of TWS --------#
  minTWS = map2@data@min
  maxTWS = map2@data@max
  norm_TWS = (TWS - minTWS)/(maxTWS - minTWS);
  map6 = raster(norm_TWS)
  map6@extent = ex
  #--------------------------------------------#
  year[i]=s1[1]
  a1[i] = mean(norm_TWS, na.rm=TRUE)
  a2[i] = mean(TWS, na.rm=TRUE)
  r.range <- c(minValue(map2), maxValue(map2))
  crs(S1)
  
  plot(map2,col=blue2green2red(50),main=paste(s1[1],""),asp = 1,col.axis= "white",col.main = 1,cex.main = 4,cex.axis=1,interpolate = TRUE,useRaster = TRUE,legend = FALSE)
  plot(map2,legend.only=TRUE,legend.width=10, legend.shrink=1.0,horiz = FALSE,xjust = 1,text.width = 2,col=blue2green2red(50),
       axis.args=list(cex.axis=3))
  #,zlim=c(-0.2,2.0)
  #mtext("Sea Surface Temperature Anomaly - Bay of Bengal", side = 3, line = 0, outer = TRUE,cex=3,font=2)
  #rev(rainbow(50)[1:45])
  #   at=seq(r.range[1], r.range[2],112),
  # labels=seq(format(round(r.range[1], 1), nsmall = 1), format(round(r.range[2], 1), nsmall = 1),112),cex.axis=2))
  
  
  # sprintf(r.range[1], fmt = '%#.1f')
  #format(round(r.range[1], 1), nsmall = 1), format(round(r.range[2], 1), nsmall = 1)
  #par(mar = par("mar"))
  #format(round(r.range[1], 2), nsmall = 2)
  plot(S1,add = TRUE)
  #brewer.pal(7,"PuRd")
  #rev(blue2green2red(100))
  #blue2green2red(100)
}
dev.off()
# write.xlsx(a1,"Ganga_TRMM.xlsx", sheetName="Sheet1",
#            col.names=FALSE, row.names=FALSE, append=FALSE, showNA=TRUE, password=NULL)

print("Operation Successful")
# graphics.off()
# par("mar")
# par(mar=c(1,1,1,1))

