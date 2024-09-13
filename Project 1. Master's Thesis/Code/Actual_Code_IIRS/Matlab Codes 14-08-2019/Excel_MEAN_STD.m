List_of_Files = dir('*.tif');

for i = 1:length(List_of_Files)
    
  [A,R] = geotiffread(List_of_Files(i).name);
  index = find(A <= min(min(A))); % Null value = -3.399999952144364e+38
  A(index) = NaN;
  
  Max(i) = nanmax(nanmax(A));
  Min(i) = nanmin(nanmin(A));
  Mean(i) = nanmean(nanmean(A));
  Std (i) = nanstd(nanstd(A));
  
  disp(i);
end

T(:,1) = Max;
T(:,2) = Min;
T(:,3) = Mean;
T(:,4) = Std;

filename = 'Data.xlsx';
F = T;
sheet = 1;
xlRange = 'A2';
xlswrite(filename,F,sheet,xlRange)
