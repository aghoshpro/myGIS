clear;
%List_of_Files = dir('*2018*.tif');

Temp = 15; %Enter the Threshold Temperature 
lower = Temp - 2;
upper = Temp + 2;

%---- Logic of Nearest Value ---------------------------------------------
Temp_test = [13.9 14.6 14.9 14.98 15.6 16.7 19.9 20.6 22];
Day_test = [152 160 164 183 196 200 206 220 263];

%index_near = intersect(find(Temp_test >= lower),find(Temp_test <= upper));
Array_near = Temp_test;%(index_near);
diff = abs(Temp_test - Temp);
idx = find(diff == min(diff));
Nearest_val = Array_near(idx);
Nearest_Day = Day_test(find(Temp_test == Nearest_val));

disp((Temp_test)');
fprintf('Nearest value of %d is --- %f ----\n\n',Temp,Nearest_val);
disp((Day_test)');
fprintf('Nearest Day is %d\n',Nearest_Day);
%-------------------------------------------------------------------------