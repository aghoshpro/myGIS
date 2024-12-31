library(raster)
library(gdalUtils)

if("gdalUtils" %in% rownames(installed.packages()) == FALSE)
{
  install.packages("gdalUtils", repos="http://r-forge.r-project.org")
  require(gdalUtils)
} #install and load the gdalUtils package. 

setwd("H://Portugal Forest Fire//Source Area//MODIS//")
filenames = list.files(pattern = "hdf")
sds <- get_subdatasets(filenames[1])

for (i in 1:length(filenames))
{
  print(i)
  sds <- get_subdatasets(filenames[i])
  gdal_translate(sds[1], dst_dataset=paste0(substr(filenames[i], 1, nchar(filenames[i])-4) ,".tif"))
}