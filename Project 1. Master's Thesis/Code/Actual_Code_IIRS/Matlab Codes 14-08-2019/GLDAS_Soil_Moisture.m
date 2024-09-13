clear;
List_of_Files = dir('*.A2017*.nc4');
Year = extractAfter(extractBefore(List_of_Files(1).name,22),17); 

latitude = ncread(List_of_Files(1).name,'lat');
longitude = ncread(List_of_Files(1).name,'lon');

%Co-ordinates to plot the results.
latmin = min(min(latitude));
latmax = max(max(latitude));
longmin = min(min(longitude));
longmax = max(max(longitude));

for i = 1:length(List_of_Files)

Soil01 = ncread(List_of_Files(i).name,'SoilMoi0_10cm_inst');
Soil02  = ncread(List_of_Files(i).name,'SoilMoi10_40cm_inst');
Soil03  = ncread(List_of_Files(i).name,'SoilMoi40_100cm_inst');
Soil04  = ncread(List_of_Files(i).name,'SoilMoi100_200cm_inst');

%----- Sum of Soil Moisture -------%
Z = nansum(cat(3,Soil01,Soil02,Soil03,Soil04),3); %Buiding a 3D Data Array
Z = Z';
Z_cell{i} = Z;

end

Z_3D = cat(3,Z_cell{:}); %Buiding a 3D Data Array
Zmean(:,:) = 0;
Zmean = nanmean(Z_3D,3); %Mean Calculation of Z_3D

%--------  Write the data into geotiff -------%
R = georasterref('RasterSize',size(Zmean),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'H:\TOTAL_INDIA_SCALED_DATA\GLDAS\Output\';  %Savefile
geotiffwrite(strcat(Destination,'GLDAS_World_Soil_Moisture_',Year),Z,R);
 
disp('Operation Successful');
