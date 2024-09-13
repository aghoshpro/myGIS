%DATA Retrival
List_of_Files = dir('*.nc'); %List of every .nc4 files in particular folder
Marge_data = 0;
Year = extractAfter(extractBefore(List_of_Files(1).name,18),13);
i = 12;
%for i = 1:length(List_of_Files)
latitude = ncread(List_of_Files(i).name,'lat');
longitude = ncread(List_of_Files(i).name,'lon');

data = ncread(List_of_Files(i).name,'sst');
% data_T = data';
disp(data(168,5));
Marge_data = Marge_data + data; 

%Co-ordinates to plot the results.
latmin = min(min(latitude));
latmax = max(max(latitude));


longmin = min(min(longitude));
longmax = max(max(longitude));
% 
% latlimit=double([(min(min(latitude))),(max(max(latitude)))]);
% longlimit=double([(min(min(longitude))),(max(max(longitude)))]);
% 
% data = double(AOD);
% 
 G = strcat(List_of_Files(i).name,'.tif');
% 
% %%To Plot Data
% % contourf(data)
% % colormap(hsv(400))
% 
% 
% Write the data into geotiff (I) 
R = georasterref('RasterSize',size(data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
geotiffwrite(G,data,R)



disp(i);
%end
% 
% R1 = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
% geotiffwrite(strcat('Marge_',Year),Marge_data,R1)
% 
% disp(Marge_data(168,5));