function [MonthlyGAmean] = MonthlyGA(list)
% list = dir('2002_1.tif_sf.tif');
% name = '2002_1.tif_sf';
for i = 1:length(list)
        [GAdata{i}, latitude{i}, longitude{i},MIN{i},MAX{i}] = Xtract(list(i).name);
end 
MIN{1} = abs(MIN{1});
filename = extractBefore(list(1).name,5); 
disp(MIN{1});
 meanMatrix2=cat(3,GAdata{:}); %Buiding a 3D Data Array
 GAmean = GAdata{1,1};
 %GAmean1 = GAdata{1,1};
 GAmean(:,:) = 0;
 
 GAmean = nanmean(meanMatrix2,3);
 
 MonthlyGAmean = nanmean(nanmean(GAmean));

% S = shaperead('states_provinces.shp','Attributes',{'X','Y','name','type'});
% n = length(S) ;

% ---- Himalaya Coordinates ----%
% latMin  =  min(min(latitude));
% latMax  =  max(max(latitude));
% longMin =  min(min(longitude));
% longMax =  max(max(longitude));

latMin  =  7.252352431195320;
latMax  =  37.30;
longMin =  68.50;
longMax =  97.0;

% latMin  =  28.30;
% latMax  =  37.30;
% longMin =  72.30;
% longMax =  81.00;
% -------------------------------

%Plotting the AOD on the MAP or Stiching
fig = figure('visible','off','units','normalized','outerposition',[0 0 1 1]);
title({[' ' filename];}, 'Interpreter', 'none', ...
       'FontSize',16, 'FontWeight','bold');
axesm('MapProjection','miller','MapLatLimit',[latMin,latMax],...
      'MapLonLimit',[longMin,longMax],'Grid','on',...
      'MeridianLabel','on','ParallelLabel','on','PLabelLocation',5,'PLabelMeridian','prime', ...
      'MLabelLocation',5,'MLabelParallel','equator');
 
gridm('--');

%surfm(latitude,longitude,A);
%surfm(X1,X2,X);
geoshow(latitude{1,1},longitude{1,1},double(GAmean), 'DisplayType','texturemap')
%surfm(latitude{1,1},longitude{1,1},double(GAmean));
geoshow('India.shp','FaceColor','none'); %Shape File

%colormap(flipud(hot));
vibgyor = [1 1 1;0 0 0; 0.7 0 1; 0.4 0.8 1; 0.3 0.1 1;0.2 0.9 0.2;1 0.9 0;0.8 0.8 0.8 ; 1 0.1 0 ;1 0.5 0 ;1 0 0.7];
colormap(vibgyor);
c = colorbar(); 
c.Label.String = 'Gravitational Anomoly';
%caxis([A2min Amax]);
caxis([-60 50]);

% for i = 1:n
%     if(strcmp(S(i).type,'State')) 
%      textm(nanmean(S(i).Y),nanmean(S(i).X),S(i).name,'Color','black','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',08);            
%     end
% end
% 
T = 'H:\TOTAL_INDIA_SCALED_DATA\Output\';
T = strcat(T,filename);
T = strcat(T,'.jpg');
print(fig,'-djpeg',T,'-r300')
% 

end
