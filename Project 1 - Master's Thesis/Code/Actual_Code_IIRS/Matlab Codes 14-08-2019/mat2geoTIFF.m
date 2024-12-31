%DATA Retrival
List_of_Files = dir('*.mat'); %List of every .mat files in particular folder
%load('15% breakup slope ASI 2008-2018.mat') %For Single .mat file load 

%This Loop converts any no of mat filse to respective geotiff
for i = 1:length(List_of_Files)
         
    load(List_of_Files(i).name);
 


% Co-ordinates to plot the results.
long = Grid.longitude;
lat = Grid.latitude;

latmin = min(min(Grid.latitude));
latmax = max(max(Grid.latitude));

longmin = min(min(Grid.longitude));
longmax = max(max(Grid.longitude));

latlimit=double([(min(min(lat))),(max(max(lat)))]);
longlimit=double([(min(min(long))),(max(max(long)))]);

data = Slope;
xlswrite('Book1.xlsx',data);%,'sheet',1,'Range','A1');
%writetable(T,filename,'Sheet',1,'Range','D1')
G = strcat(List_of_Files(i).name,'.tif');

%%To Plot Data
% contourf(data)
% colormap(hsv(400))


% % Write the data into geotiff (I) 
R = georasterref('RasterSize',size(data),'LatitudeLimits',[latmin,latmax],'LongitudeLimits',[longmin,longmax]);
geotiffwrite(G,data,R)
% 
% % Write the data into geotiff (II)
% cellsize = 0.1;
% [Z, refvec] = geoloc2grid(lat, long, double(data), cellsize);
% R = refvecToGeoRasterReference(refvec,size(Z));
% 
% 
% % Save the vector into GeoTIFF.
%   geotiffwrite(G, Z, R);



end

% %%Read geotiff file
% [A, R] = geotiffread(tiffile);
% figure
% mapshow(A, R);