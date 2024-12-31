library(raster)
library(rasterVis)
library(gplots)
library(maptools)
library(scales)  #for transparency
library(rgdal)
library(Cairo)
library(graphics)
library(mapproj)


fig = c(0,1,0,1)
dev.new()

setwd("C://Users//ARKA GHOSH//Desktop//PHD//Stockholm University//Interview//FP//combined//") # same folder as the ZIP-File
t1 = list.files(pattern = "T.csv$")
t2 = list.files(pattern = "A.csv$")

S1 = shapefile('C:/Users/ARKA GHOSH/Desktop/PHD/Stockholm University/Interview/Leiraat.shp')
ex_custom = extent(c(-9.547082, -6.189142, 36.96097, 42.29554))



# par(mfrow=c(2,6))
# i = 2

for (i in 1:length(t1)) {
  
  s = strsplit(t1[i],".",fixed = TRUE)[[1]]
  date = as.Date(as.numeric(substr(s[1], 5, 7))-1, origin = "2017-01-01")
  data =read.table(t1[i],sep = ",")
  data2 =read.table(t2[i],sep = ",")
  
  Cairo(file=paste(date,"GRID_Portugal_Terra_FP.png"),
        type="png",
        units="px",
        bg = "white",
        width=2400,
        height=1200,
        pointsize=10,
        dpi= 100)
  


  
  plot(S1,lwd = 2,col=alpha("darkgreen", 0.0),main=paste(date,""),col.axis= "black",asp = 1,cex.main = 3,cex.axis = 2)
  points(data$V2,data$V1, pch=19, col="red", cex=0.5, add = TRUE)
  points(data2$V2,data2$V1, pch=19, col="red", cex=0.5, add = TRUE)
  
  print(i)
  dev.off()
}



print("Operation Successful")