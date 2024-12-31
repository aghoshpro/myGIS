clear;
List_of_Files = dir('*.hdf');
for i = 1:length(List_of_Files)
 %i = 4;
FILE_NAME = List_of_Files(i).name;
Part01 = extractAfter(extractBefore(List_of_Files(i).name,6),0);
Part02 = extractAfter(extractBefore(List_of_Files(i).name,9),6);
Part03 = extractAfter(extractBefore(List_of_Files(i).name,18),10);
Part04 = extractAfter(extractBefore(List_of_Files(i).name,23),18);
Part05 = extractAfter(extractBefore(List_of_Files(i).name,27),23);
Part06 = extractAfter(extractBefore(List_of_Files(i).name,42),27);
% %filename = strcat(Part01,'_',Part02,'_',Part03,'_',Part04,'_',Part05,'_',Part06);
% filename = strcat(Part01,Part02,Part03,Part04,Part05,Part06);

SWATH_NAME='mod07';
DATAFIELD_NAME_01 = 'Retrieved_Moisture_Profile';%'Solar_Zenith';
DATAFIELD_NAME_02 = 'Pressure_Level';

file_id = hdfsw('open', FILE_NAME, 'rdonly');
swath_id = hdfsw('attach', file_id, SWATH_NAME);

[Solar, status] = hdfsw('readfield', swath_id, DATAFIELD_NAME_01, [], [], []);
[Pressure, status] = hdfsw('readfield', swath_id, DATAFIELD_NAME_02, [], [], []);

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

  for k = 1:length(Pressure)
            data{k} = (double(Solar(:,:,k)))';
            
            Long_cell{k} = double(longitude);
            Lat_cell{k} = double(latitude);
            index = find(data{1,k} <= nanmin(data{1,k}));  %Null value = -3.399999952144364e+38
            data{1,k}(index) = NaN; 
   end
G = strcat('MOD07_',Part04,'_Retrieved_Moisture_Profile_');
% G = strcat(filename,'_RPF_');
Moisture_Matrix = cat(3,data{:}); %Buiding a 3D Data Array

%%%------ Write the data into geotiff (I) 
% R = georasterref('RasterSize',size(data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
% geotiffwrite(G,data,R)
Destination = 'C:\Users\ARKA GHOSH\Downloads\MODIS\MODIS\Retrieved_Moisture_Profile\';  %Savefile

%------ Write the data into geotiff (II) ------%
   for K = 1 : length(Pressure)
    
   cellsize = 0.0449155875; %0.1 == 11.0Km
   [Z, refvec] = geoloc2grid(double(latitude), double(longitude), double(Moisture_Matrix(:,:,K)), cellsize);
   R = refvecToGeoRasterReference(refvec,size(Z));

   %Save the vector into GeoTIFF.
   geotiffwrite(strcat(Destination,G,num2str(Pressure(K))),Z,R);

   %FILE_NAME = char();
  end

end