
degreeToRadian<- function(angle)
{
  r = (angle * pi)/180
  return(r)
}

radianToDegree<- function(angle)
{
  deg = (angle * 180)/pi
  return(deg)
}

getLongLat<- function(long_p, lat_p ,dist_p,bear_p)
{
  if(bear_p<0)
    bear_p = bear_p + 180
  
  lat_p = degreeToRadian(lat_p)
  long_p = degreeToRadian(long_p)
  bear_p = degreeToRadian(bear_p)
  d = dist_p
  R = 6378137
  lat_n = asin(sin(lat_p)*cos(d/R) + cos(lat_p)*sin(d/R)*cos(bear_p))
  long_n = long_p + atan2(sin(bear_p)*sin(d/R)*cos(lat_p), cos(d/R) - sin(lat_p)*sin(lat_n))
  arr = cbind(radianToDegree(long_n),radianToDegree(lat_n))
  return(arr)
}


bearing_pts = bearing(coords, coords2)
dist_pts = distCosine(coords, coords2)
coords = getLongLat(coords[,1],coords[,2], dist_pts , bearing_pts)
