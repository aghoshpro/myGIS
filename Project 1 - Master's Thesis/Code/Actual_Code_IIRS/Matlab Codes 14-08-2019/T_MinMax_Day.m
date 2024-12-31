clear;
List_of_Files = dir('*.tif');
%List_of_Files_Year = dir('*2009*.tif');  %Files for a particular year *2009*

[A,RR] = geotiffread(List_of_Files(1).name);
info = geotiffinfo(List_of_Files(1).name);

Array = 0;
Day = 0;

Year = extractAfter(extractBefore(List_of_Files(1).name,5),0) ;
  
for i = 1:length(List_of_Files)
  [A,R] = geotiffread(List_of_Files(i).name);
  
  index = find(A <= min(A));  %Null value = -3.399999952144364e+38
  A(index) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  SST{i} = A;
  
  Day(i) = str2double(extractAfter(extractBefore(List_of_Files(i).name,8),4)); %Day is extracted
  
  disp(i); 
end

SST_3D = cat(3,SST{:}); %Buiding a 3D Data Array

%--------------- T-MAX ----------------%
Zmax_Day(info.Height,info.Width,1)= 0;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Array(k) = SST_3D(i,j,k);
        end
        
        [valmax, idxmax] = nanmax(Array);
                
        if(~isnan(valmax))
            Zmax_Day(i,j)= Day(idxmax);
        else
            Zmax_Day(i,j)= valmax;
        end  
          
        Array = 0;
    end
end

%------ Write the Tmax_Day data into geotiff ------------------% 
% R1 = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\Anirban da\Filter\';  %Savefile
geotiffwrite(strcat(Destination,'SST_Tmax_Day_',Year),Zmax_Day,RR);

%--------------- T-Min ----------------%
Zmin_Day(info.Height,info.Width,1)= 0;
i = 0; j = 0; k = 0;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Array(k) = SST_3D(i,j,k);
        end
              
        [valmin, idxmin] = nanmin(Array);
                
        if(~isnan(valmin))
            Zmin_Day(i,j)= Day(idxmin);
        else
            Zmin_Day(i,j)= valmin;
        end  
        Array = 0;
    end
end    
 

%------ Write the Tmin_Day data into geotiff ------------------% 
%R = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\Anirban da\Filter\';  %Savefile
geotiffwrite(strcat(Destination,'SST_Tmin_Day_',Year),Zmin_Day,RR);

disp('Operation Successful');