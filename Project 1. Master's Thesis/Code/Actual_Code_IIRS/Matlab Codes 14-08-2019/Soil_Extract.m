function [Canopy,A,B] = Soil_Extract(source)
X1 = ncread(source,'lat');
X2 = ncread(source,'lon');

%Soil01 = ncread(source,'SoilMoi0_10cm_inst');
%Soil02  = ncread(source,'SoilMoi10_40cm_inst');
%Soil03  = ncread(source,'SoilMoi40_100cm_inst');
%Soil04  = ncread(source,'SoilMoi100_200cm_inst');
Canopy = ncread(source,'CanopInt_inst');
%Rain_precipitation_rate = ncread(source,'Rainf_tavg');
%Transpiration = ncread(source,'Tveg_tavg');
%Evapotranspiration = ncread(source,'Evap_tavg');

lt = length(X1);
lg = length(X2);

for i = 1:lg
   for j=1:lt 
    mtxlat(i,j) = X1(j);
   %p(row, col) = 0.2 * roh(row) * v(col).^3 * frontal_area
   end
end

for j = 1:lt
   for i=1:lg 
    mtxlong(j,i) = X2(i);
       %p(row, col) = 0.2 * roh(row) * v(col).^3 * frontal_area
   end
end

transposelong = mtxlong';
A = double(mtxlat);
B = double(transposelong);

end