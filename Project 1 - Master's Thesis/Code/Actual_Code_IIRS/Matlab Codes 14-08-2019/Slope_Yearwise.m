clear;
List_of_Files = dir('*.tif');

[A,RR] = geotiffread(List_of_Files(1).name); %A is Data Matrix & RR is Georeference Object
info = geotiffinfo(List_of_Files(1).name);

Array = 0;
Test_Array = 0;

Year = (2008:2018);

for i = 1:length(List_of_Files)
    
  [A,R] = geotiffread(List_of_Files(i).name);
  
  index = find(A <= min(A));    %Null value = -3.399999952144364e+38
  A(index) = NaN;               %Convert -3.399999952144364e+38 in to NaN
  Test_Array(i) = A(110,10);
  SST{i} = A;
  disp(i); 
  
end

SST_3D = cat(3,SST{:}); %Buiding a 3D Data Array

%--------------- 10 Years Temperature Slope ----------------%
Zslope(info.Height,info.Width,1)= 0;

for i = 1:info.Height
    for j = 1:info.Width
        
        for k = 1:length(List_of_Files)
            Array(k) = SST_3D(i,j,k);
        end
        
        Array = Array(~isnan(Array)); %NaN Values are eleminated
        Y =  Year(~isnan(Array)); 
        
        if(isempty(Array) == 1)
            Zslope(i,j) = NaN;
        else
            p = polyfit(Y,Array,1);
            Zslope(i,j)= p(1);
        end
        
        Array = 0;
        
    end
end

%%--------- Write the Slope data into geotiff ---------% 

%R = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\Anirban da\Filter\';  %Savefile
geotiffwrite(strcat(Destination,'SST_Tmax_Slope'),Zslope,RR);

disp('Operation Successful');
