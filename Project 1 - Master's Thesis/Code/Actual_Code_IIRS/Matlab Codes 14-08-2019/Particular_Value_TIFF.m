clear;
List_of_Files = dir('*.tif');
i =1;
%for i = 1:length(List_of_Files)
    
  [A,R] = geotiffread(List_of_Files(i).name);
  index = find(A <= min(A)); % Null value = -3.399999952144364e+38
  A(index) = NaN;            % Convertion of -3.399999952144364e+38 into NaN
   
  Range = [nanmin(nanmin(A)),nanmax(nanmax(A))];
  
  %---- Input Values ----%
  Key = 277;
  Replace = 9999;
  
  Data = A;
  B = A;
  
  %-----01------------------------------------------------
  indexkey = find(A == Key); 
  A(indexkey) =   NaN;
  
  %A(indexkey) =   Replace;
  
  %-----02------------------------------------------------
  indexkey_rev = find(B<= lower_bound);
  B(indexkey_rev) = NaN; % or Replace
  
  indexrev = 0;
  
  indexkey_rev = find(B >= upper_bound);  
  B(indexkey_rev) = NaN; %or Replace
  
  
  Year = extractAfter(extractBefore(List_of_Files(i).name,5),0);
  Day = str2double(extractAfter(extractBefore(List_of_Files(i).name,8),4));
  
%%------------- Write the Raster Data into geotiff ------------------% 
  Destination = 'C:\Users\ARKA GHOSH\Desktop\GeoTIFF\\Anirban da\Output 2\';  %Savefile
  geotiffwrite(strcat(Destination,num2str(Day),'_of_',Year,'Particular_Value'),B,R)
  geotiffwrite(strcat(Destination,num2str(Day),'_of_',Year,'Particular_Value_Reverse'),A,R)

  disp(i);

%end