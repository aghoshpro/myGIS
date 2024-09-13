library(raster)
library(rgdal)
library(maptools)
library(gdalUtils)
library(rasterVis)
library(gplots)
library(maptools)
library(rgdal)
library(ncdf4)
library(filesstrings)

setwd("C://Users//ARKA GHOSH//Downloads//2003//")
dir.create("corrupt")
new.folder <- "C:/Users/ARKA GHOSH/Downloads/2003/corrupt/"
ncfname = list.files(pattern = ".nc$")
year <- array(0,dim =length(ncfname))
corrupt = array(0)#,dim =length(ncfname))

# for (j in 1:length(ncfname)) {
#   s = strsplit(ncfname[j],"_")[[1]]
#   year[j] = s[5]
# }
I = shapefile('C:/Users/ARKA GHOSH/Desktop/Hudson/Hudson_Bay.shp')
ex = extent(I)
count =0


# # Reading Long & Lat from nc file --------------------------------------------------
for(k in 1:length(ncfname)){
  
  s = strsplit(ncfname[k],"_")[[1]]
  year[k] = s[5]
  
  t = ncfname[k]
  
  # open a NetCDF file
  nc <- try(nc_open(ncfname[k]),silent = TRUE)
  
  if(is.list(nc)==FALSE)
  {
    count = count + 1
    corrupt[count] = ncfname[k]
  }else{
  
  # Reading Long & Lat from nc file --------------------------------------------------
  Long <- ncvar_get(nc, varid = "lon")
  Lat <- ncvar_get(nc, varid = "lat")
  
  #-----------------------------------------------------------------------------------
  # Data reading from nc file
  Hudson_Bay<- ncvar_get(nc,"mean_sea_surface")
  Hudson_bathymetry<- ncvar_get(nc,"bathymetry")
  geoid <- ncvar_get(nc,"geoid")
  Hudson_SSHA <- ncvar_get(nc,"ssha")
  
  # Limit vector
  # index = which(Lat>=ex[3] & Lat<=ex[4] & Long>= 264 & Long<= 282 )
  # New_Lat = Lat[index]
   New_Lat = c(Lat) 
  # 
  # New_Long = Long[index]
   New_Long = c(Long) 
  # 
  # Hudson = Hudson_Bay[index]
   MSS = c(Hudson_Bay)
  # 
  # bathymetry = Hudson_bathymetry[index]
   bathymetry = c(Hudson_bathymetry)
  # 
  # geoid_h = geoid[index]
   geoid_h = c(geoid)
  # 
  # SSHA = Hudson_SSHA[index]
  SSHA = c(Hudson_SSHA)
  
  # Time = TT[index]
  # Time = c(Time)
  MyData <- cbind.data.frame(New_Long,New_Lat,SSHA,MSS,bathymetry,geoid_h)
  
  #convert data to shapefile    
  WGScoor =  MyData #data to convert
  coordinates(WGScoor)= ~New_Long + New_Lat #column names of the lat long cols
  proj4string(WGScoor) = CRS("++proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0") # set coordinate system to WGS
  
  #Write Shape File 
  raster::shapefile(WGScoor,paste(s[2],"_",s[4],"_",s[5],"_Hudson.shp"),overwrite=TRUE)
  
  rm(New_Long,New_Lat,SSHA,MSS,bathymetry,geoid_h,WGScoor)
  }
  print(k)
  
}

file.copy(corrupt,new.folder,overwrite = TRUE)

print(paste(count,"Files are found corrupt, Files are"))
print(corrupt)

# print(length(ncfname))
# unlink(corrupt, recursive=TRUE,force = TRUE)
# file.move(corrupt,new.folder,overwrite = TRUE)
# print(length(list.files(pattern = ".nc$")))

print("NetCDF to Shapefile Convertion is Completed")