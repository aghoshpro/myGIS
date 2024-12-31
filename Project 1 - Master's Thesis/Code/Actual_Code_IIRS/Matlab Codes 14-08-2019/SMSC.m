clear;
Soil400_list = dir('*.A2002*.nc4');
filen = extractAfter(extractBefore(Soil400_list(1).name,22),17); 

for i = 1:length(Soil400_list)
          %= Soil400_list(i).name;
        [Source{i},Lat{i},Long{i}] = Soil_Extract(Soil400_list(i).name);
end

disp(length(Source));
%---- Coordinates ----------------------------------------------------------
% latMin  =  7.252352431195320;
% latMax  =  37.30;
% longMin =  68.50;
% longMax =  97.0;

%---- Shapefile Read -------------------------------------------------------
%S1 = shaperead('H:/TOTAL_INDIA_SCALED_DATA/India.shp');%,'Attributes',{'X','Y','name','type'});
% GangaBasin = S1.BoundingBox;
% XlatMin  =  GangaBasin(1,2);%Kashmir(1,2);
% XlatMax  =  GangaBasin(2,2); %Kashmir(2,2);
% XlongMin =  GangaBasin(1,1);%72.30;%Kashmir(1,1);
% XlongMax =  GangaBasin(2,1);%Kashmir(2,1);

%---- Data Matrix Buiding -----------------------------------------------------
Soil_Matrix=cat(3,Source{:}); %Buiding a 3D Data Array
Soil_mean = Source{1,1};
%Soil_mean1 = Source{1,1};
Soil_mean(:,:) = 0;
Soil_mean = nanmean(Soil_Matrix,3);

%---- Data Extraction------------------------------------------------------
 Z = Soil_mean;
%  V = Z;
%  ind = inpolygon(Long{1,1},Lat{1,1},[XlongMin,XlongMax],[XlatMin,XlatMax]);  
%  V = V(ind);
%  row = length(Z(:,1));
%  col = length(Z(1,:));
%  
%  K1 = nanmean(V);
%   
%  
%  for i = 1:row
%     for j=1:col
%         if(ind(i,j) == 1)
%             Z(i,j) = Soil_mean(i,j); 
%         else
%             Z(i,j) = NaN;
%         end
%      
%     end
%  end
% 
% K2 = nanmean(nanmean(Z));
% 
% 




%----------------------------------------------------
%------------------------------------------------------------------------------------------------------------

% fig01 = figure('visible','on','units','normalized','outerposition',[0 0 1 1]);
% %subplot(1,2,1)
% title({['SMSC 100 - 200 cm' filen];}, 'Interpreter', 'none', ...
%        'FontSize',16, 'FontWeight','bold');
% axesm('MapProjection','miller','MapLatLimit',[latMin,latMax],...
%       'MapLonLimit',[longMin,longMax],'Frame','off','Grid','on',...
%       'MeridianLabel','on','ParallelLabel','on','PLabelLocation',2,'PLabelMeridian','prime', ...
%       'MLabelLocation',2,'MLabelParallel','equator');
%  
% gridm('-');
% geoshow('India.shp','FaceColor','none');
% %geoshow(latitude{1,1},longitude{1,1},double(Z), 'DisplayType','texturemap')
% surfm(Lat{1,1},Long{1,1},double(Z));
% %textm(latitude{1,1},longitude{1,1},Zs,'Color','black');
% geoshow('H:\JU Project\River_basin\Ganga_basin.shp','FaceColor','none');
% geoshow([S1.Y], [S1.X],'Color','red','linewidth',1);
% 
% %colormap(flipud(jet));
% % vibgyor = [0 0 0; 0.7 0 1; 0.4 0.8 1; 0.3 0.1 1;0.2 0.9 0.2;1 0.9 0;0.8 0.8 0.8 ; 1 0.1 0 ;1 0.5 0 ;1 0 0.7];
% % colormap(vibgyor);
% %shading flat;
% %hold on
% c = colorbar(); 
% c.Label.String = 'Soil Moisture 100 to 200 cm';
% %caxis([-50 50]);

% %---- GeoTIFF Convertion ----%
%D=data';
cellsize = 0.25;
%[Z, refvec] = geoloc2grid(lat, long, double(D), cellsize); % Vector Size Mismatch
[Z1, refvec] = geoloc2grid(Lat{1,1},Long{1,1},double(Z), cellsize);

%---- Screening values of Z < 0 -OR- Z = NaN -----%
% Zs=Z;
% 
% ndex1 = find(Z <= 0);  %(-ve) values screened out
% Zs(index1) = 0;
% index2 = find(isnan(Z));% NaN values screened out
% 
% Zs(index2) = 0; % Zs = Final Z vector
%------------------------------------------------%
% Main_Z = {Z1,Z2,Z3,Z4};
% ZZ = cat(3,Main_Z{:});
R = refvecToGeoRasterReference(refvec,size(Z1));

% Save the vector into GeoTIFF.
filename = [filen,'.Canopy.tif' ];
geotiffwrite(filename, Z1, R);
