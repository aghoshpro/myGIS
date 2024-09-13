List_of_Files = dir('*.tif');

[A,RR] = geotiffread(List_of_Files(1).name);
info = geotiffinfo(List_of_Files(1).name);

Array = 0;
Test_Array = 0;

Year = extractAfter(extractBefore(List_of_Files(1).name,18),13) ;
 
for i = 1:length(List_of_Files)
    
  [A,R] = geotiffread(List_of_Files(i).name);
  
  index = find(A <= min(A));  %Null value = -3.399999952144364e+38
  A(index) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  
  Test_Array(i) = A(115,7);
  SST{i} = A;
  disp(i); 
end

SST_3D = cat(3,SST{:}); %Buiding a 3D Data Array
SSTmean(:,:) = 0;
SSTmean = nanmean(SST_3D,3); %Mean Calculation of SST_3D

%%------- Write the Mean Raster data into geotiff ------------%

%R = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Downloads\Polar_steriographic_tiff\Output\';  %Savefile
geotiffwrite(strcat(Destination,'15%_Thrshold_Mean'),SSTmean,RR,'GeoKeyDirectoryTag',info.GeoTIFFTags.GeoKeyDirectoryTag);

disp('Operation Successful');