clear;
Span = (2008:2018);
%a = strcat('*',num2str(Span(8)),'*.tif');
for m = 1:length(Span)
    
List_of_Files = dir(strcat('*',num2str(Span(m)),'*.tif'));%dir('*2008*.tif');
%List_of_Files_Year = dir('*2009*.tif');  %Files from a particular year *2009*
%PROJCS["WGS_1984_Stereographic_South_Pole",GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Stereographic_South_Pole"],PARAMETER["False_Easting",0.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",0.0],PARAMETER["Standard_Parallel_1",-71.0],UNIT["Meter",1.0]]
Temp = 15;
lower = Temp - 1;
upper = Temp + 1;

% R1 = load('RR.mat'); %For Single .mat file load 
% R2 = R1.RR;

%---- Logic of Nearest Value ---------------------------------------------
% Temp_test = [13.9 14.6 14.9 15.6 16.7 19.9 20.6 22];
% Day_test = [152 160 164 183 196 200 206 220];
% index_near = intersect(find(Temp_test >= lower),find(Temp_test <= upper));
% Array_near = Temp_test(index_near);
% diff = abs(Temp_test(index_near) - Temp);
% idx = find(diff == min(diff));
% Nearest_val = Array_near(idx);
% Nearest_Day = Day_test(find(Temp_test == Nearest_val));
%-------------------------------------------------------------------------

[B,RR] = geotiffread(List_of_Files(1).name);
info = geotiffinfo(List_of_Files(1).name);

[row, col]=find(B == Temp);

Year = extractAfter(extractBefore(List_of_Files(1).name,5),0);

for i=length(List_of_Files):-1:1
  [Data_Matrix,R] = geotiffread(List_of_Files(i).name);
  
  index = find(Data_Matrix <= min(Data_Matrix));  %Null value = -3.399999952144364e+38
  Data_Matrix(index) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  Day(i) = str2double(extractAfter(extractBefore(List_of_Files(i).name,8),4)); %Day is extracted
  Cryo_Percentage{i} = Data_Matrix;
  disp(i); 
  
end

Cryo_3D = cat(3,Cryo_Percentage{:}); %Buiding a 3D Data Array

% % %--------------- Threshold Temperature DOY ----------------%
Z_Temp(info.Height,info.Width,1)= 0;
Z_Day(info.Height,info.Width,1)= 0;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Pixel_temp(k) = Cryo_3D(i,j,k);
        end
        
        index_near = intersect(find(Pixel_temp >= lower),find(Pixel_temp <= upper));
        Array_near = Pixel_temp(index_near);
        diff = abs(Pixel_temp(index_near) - Temp);
        idx = find(diff == min(diff));
        Nearest_val = Array_near(idx);
        
         if(isempty(Nearest_val)== 1)
            Z_Temp(i,j) = NaN;
            Z_Day(i,j) = NaN;
         elseif(isnan(Nearest_val) == 1)
            Z_Temp(i,j) = NaN;
            Z_Day(i,j) = NaN;
         elseif(numel(Nearest_val)>= 2)
            Z_Temp(i,j)= nanmean(Nearest_val); %For same distance values from given Temp
            Xday = Day(find(Pixel_temp == Nearest_val(1)));
            Z_Day(i,j) = Xday(1);
         else
            Z_Temp(i,j)= Nearest_val;       %Otherwise only one value 
            Yday = Day(find(Pixel_temp == Nearest_val(1)));
            Z_Day(i,j) = Yday(1);
            %Z_Day(i,j) = Day(find(Pixel_temp == Nearest_val));
         end
          
        Pixel_temp = 0;
        Nearest_val = 0;
    end
end

% %------ Write the Tmax data into geotiff ------------------% 
% % R1 = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Downloads\Polar_steriographic_tiff\Output_Reverse\';  %Savefile

filename01 = strcat(num2str(Temp),'%_Threshold_Temp_Reverse_',num2str(Year),'.csv');%'Z_Temp_2008.csv';
csvwrite(strcat(Destination,filename01),Z_Temp);

filename02 = strcat(num2str(Temp),'%_Threshold_Day_Reverse_',num2str(Year),'.csv');%'Z_Day_2008.csv';
csvwrite(strcat(Destination,filename02),Z_Day);


% Destination = 'C:\Users\ARKA GHOSH\Downloads\Polar_steriographic_tiff\Output\';  %Savefile
% geotiffwrite(strcat(Destination,Temp,'%_Threshold_Temp_',Year),Z_Temp,R2,'GeoKeyDirectoryTag',info.GeoTIFFTags.GeoKeyDirectoryTag);
% geotiffwrite(strcat(Destination,Temp,'%_Threshold_Day_',Year),Z_Day,R2,'GeoKeyDirectoryTag',info.GeoTIFFTags.GeoKeyDirectoryTag);
%  
%disp('Operation Successful');

fprintf('Operation Successful for year = %d\n',Span(m));

end
