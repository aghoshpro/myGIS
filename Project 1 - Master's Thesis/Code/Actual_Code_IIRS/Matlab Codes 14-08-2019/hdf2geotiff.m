FILE_NAME='MOD04_L2.A2017169.1110.006.2017169201257_FIRE.hdf';
SWATH_NAME='mod04';
DATAFIELD_NAME = 'Deep_Blue_Aerosol_Optical_Depth_550_Land';
file_id = hdfsw('open', FILE_NAME, 'rdonly');
swath_id = hdfsw('attach', file_id, SWATH_NAME);

[AOD, status] = hdfsw('readfield', swath_id, DATAFIELD_NAME, [], [], []);

Parameter_name = 'Latitude';
[info, latitude] = readHDF(FILE_NAME,Parameter_name,[0 0],[-9 -9]);

Parameter_name = 'Longitude';
[info, longitude] = readHDF(FILE_NAME,Parameter_name,[0 0],[-9 -9]);

% Co-ordinates to plot the results.
latmin = min(min(latitude));
latmax = max(max(latitude));

longmin = min(min(longitude));
longmax = max(max(longitude));

latlimit=double([(min(min(latitude))),(max(max(latitude)))]);
longlimit=double([(min(min(longitude))),(max(max(longitude)))]);

data = double(AOD);

G = strcat(FILE_NAME,'.tif');

%%To Plot Data
% contourf(data)
% colormap(hsv(400))


% Write the data into geotiff (I) 
R = georasterref('RasterSize',size(data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
geotiffwrite(G,data,R)
