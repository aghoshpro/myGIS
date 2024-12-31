clear;
List_of_Files = dir('*.tif');
i =1;
for i = 1:length(List_of_Files)
    
  [A,R] = geotiffread(List_of_Files(i).name);
  index = find(A <= min(A)); % Null value = -3.399999952144364e+38
  A(index) = NaN;            % Convertion of -3.399999952144364e+38 into NaN
   
  Range = [nanmin(nanmin(A)),nanmax(nanmax(A))];
  
  %---- Input Values ----%
  lower_bound = 277;
  upper_bound = 278;
    
  Data = A;
   
  %-----Data within l & u bound turned in NaN------------------------------------------------
  indexkey = find(A>= lower_bound & A <= upper_bound); 
  A(indexkey) =   NaN;
  
  Year = extractAfter(extractBefore(List_of_Files(i).name,5),0);
  Day = str2double(extractAfter(extractBefore(List_of_Files(i).name,8),4));
  
%   %------------- Write the Raster Data into geotiff ------------------% 
  Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\\Anirban da\Output 2\';  %Savefile
  geotiffwrite(strcat(Destination,num2str(Day),'_of_',Year,'Range_Value_NaN'),A,R)

  disp(i);

end