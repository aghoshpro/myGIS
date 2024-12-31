clear;
List_of_Files = dir('*.tif');
%List_of_Files_Year = dir('*2009*.tif');  %Files from a particular year *2009*

[A,RR] = geotiffread(List_of_Files(1).name);
info = geotiffinfo(List_of_Files(1).name);

Array = 0;

Year = extractAfter(extractBefore(List_of_Files(1).name,5),0) ;
 
for i = 1:length(List_of_Files)
  [A,R] = geotiffread(List_of_Files(i).name);
  
  index = find(A <= min(A));  %Null value = -3.399999952144364e+38
  A(index) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  
  SST{i} = A;
  disp(i); 
end

SST_3D = cat(3,SST{:}); %Buiding a 3D Data Array

%--------------- T-MAX ----------------%
Zmax_K(info.Height,info.Width,1)= 0;
Zmax_C=Zmax_K;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Array(k) = SST_3D(i,j,k);
        end
        
        Zmax_K(i,j)= nanmax(Array);
        Array = 0;
    end
end

%---- T(°C) = T(K) - 273.15 -----%
Zmax_C = Zmax_K - 273.15; %
%--------------------------------%

%------ Write the Tmax data into geotiff ------------------% 
% R1 = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\Anirban da\Filter\';  %Savefile
geotiffwrite(strcat(Destination,'SST_Tmax_',Year),Zmax_C,RR)

%--------------- T-Min ----------------%
Zmin_K(info.Height,info.Width,1)= 0;
Zmin_C=Zmin_K;
i = 0; j = 0; k = 0;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Array(k) = SST_3D(i,j,k);
        end
        Zmin_K(i,j)= nanmin(Array); 
        Array = 0;
    end
end    
 
%---- %T(°C) = T(K) - 273.15 -----%
Zmin_C = Zmin_K - 273.15; 
%---------------------------------%

%%--------- Write the Tmin data into geotiff --------------%
%R = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\Anirban da\Filter\';  %Savefile
geotiffwrite(strcat(Destination,'SST_Tmin_',Year),Zmin_C,RR)

disp('Operation Successful');
