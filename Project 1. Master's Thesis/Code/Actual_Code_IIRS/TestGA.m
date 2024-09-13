%function [MonthlyGAmean] = MonthlyGA(list)
  list = dir('2017_*.tif_sf.tif');
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

S1 = shaperead('India.shp','Attributes',{'X','Y','name','type'});
n1 = length(S1) ;

Kashmir = S1(14).BoundingBox;

% s = S1;
% s(13).Geometry = []; s(13).BoundingBox = []; s(13).X = []; s(13).Y = [];
% s(14).Geometry = []; s(14).BoundingBox = []; s(14).X = []; s(14).Y = [];
% s(34).Geometry = []; s(34).BoundingBox = []; s(34).X = []; s(34).Y = [];


S2 = shaperead('states_provinces.shp','Attributes',{'X','Y','name','type'});
n1 = length(S2) ;

% ThreeStates(1).Geometry = S1(14).Geometry;
% ThreeStates(1).BoundingBox = S1(14).BoundingBox;
% ThreeStates(1).X = S1(14).X;
% ThreeStates(1).Y = S1(14).Y;
% 
% ThreeStates(2).Geometry = S1(14).Geometry;
% ThreeStates(2).BoundingBox = S1(14).BoundingBox;
% ThreeStates(2).X = S1(14).X;
% ThreeStates(2).Y = S1(14).Y;
% 
% ThreeStates(2).Geometry = S1(13).Geometry;
% ThreeStates(2).BoundingBox = S1(13).BoundingBox;
% ThreeStates(2).X = S1(13).X;
% ThreeStates(2).Y = S1(13).Y;
% 
% ThreeStates(3).Geometry = S1(34).Geometry;
% ThreeStates(3).BoundingBox = S1(34).BoundingBox;
% ThreeStates(3).X = S1(34).X;
% ThreeStates(3).Y = S1(34).Y;
% 
% ThreeStates

% ---- Himalaya Coordinates ----%
% latMin  =  min(min(latitude));
% latMax  =  max(max(latitude));
% longMin =  min(min(longitude));
% longMax =  max(max(longitude));

% latMin  =  7.252352431195320;
% latMax  =  37.30;
% longMin =  68.50;
% longMax =  97.0;

latMin  =  28.30;
latMax  =  37.30;
longMin =  72.30;
longMax =  81.30;

XlatMin  =  Kashmir(1,2);
XlatMax  =  Kashmir(2,2);
XlongMin =  Kashmir(1,1);
XlongMax =  Kashmir(2,1);

% -------------------------------

% %--- Latitude Extraction -------%
 lent1 = find(latitude{1,1} >= XlatMin);
  templat = latitude{1,1}(lent1);
 lent2 = find(templat <= XlatMax);
  Newlat = templat(lent2);
%  
  indexLAT = lent1(lent2); %Extracted lat
%  
% %--- Longitude Extraction -------%
 lont1 = find(longitude{1,1} >= XlongMin);
 templong = longitude{1,1}(lont1);
 lont2 = find(templong <= XlongMax);
 Newlong = templong(lont2);
 
 indexLONG = lont1(lont2);%Extracted long
 Z = GAmean;
 V = Z;
 

 ind = inpolygon(longitude{1,1},latitude{1,1},[XlongMin,XlongMax],[XlatMin,XlatMax]);  
 V = V(ind);
 row = length(Z(:,1));
 col = length(Z(1,:));
 
 K1 = nanmean(V);
  
 
 %---- Data Extraction ---------
 for i = 1:row
    for j=1:col
        if(ind(i,j) == 1)
            Z(i,j) = GAmean(i,j);
            
        else
            Z(i,j) = NaN;
        end
     % Z(i,j) = GAmean(indexLAT(i),indexLONG(j));
     %disp(GAmean(indexLAT(i),indexLONG(j)));
    end
 end

K2 = nanmean(nanmean(Z));
 %-----------------------------------

%Plotting the AOD on the MAP or Stiching
% fig = figure('visible','on','units','normalized','outerposition',[0 0 1 1]);
% %title({[' ' filename];}, 'Interpreter', 'none', ...
%        %'FontSize',16, 'FontWeight','bold');
% axesm('MapProjection','miller','MapLatLimit',[latMin,latMax],...
%       'MapLonLimit',[longMin,longMax],'Grid','on',...
%       'MeridianLabel','on','ParallelLabel','on','PLabelLocation',2,'PLabelMeridian','prime', ...
%       'MLabelLocation',2,'MLabelParallel','equator');
%  
% gridm('-');
% geoshow(latitude{1,1},longitude{1,1},double(GAmean), 'DisplayType','texturemap')
% %surfm(latitude{1,1},longitude{1,1},double(GAmean));
% %geoshow(Z,R,'DisplayType','texturemap');
% %mapshow(Z,refvec,'DisplayType','texturemap')%
% %geoshow('India.shp','FaceColor','none'); %Shape File
% %textm(S1(1).Y,S1(1).X,".",'Color','black');   
% % geoshow(S1(34).Y,S1(34).X,'DisplayType','Point','Marker','.','MarkerEdgeColor','[0 0 0]','MarkerSize',2);
% % geoshow(S1(13).Y,S1(13).X,'DisplayType','Point','Marker','.','MarkerEdgeColor','[0 0 0]','MarkerSize',2);
% % geoshow(S1(14).Y,S1(14).X,'DisplayType','Point','Marker','.','MarkerEdgeColor','[0 0 0]','MarkerSize',2);
% 
% geoshow([S1(14).Y], [S1(14).X],'Color','black','linewidth',2);
% geoshow([S1(13).Y], [S1(13).X],'Color','black','linewidth',2);
% geoshow([S1(34).Y], [S1(34).X],'Color','black','linewidth',2);
% %geoshow(s,'FaceColor','white'); %Shape File
% 
% colormap(flipud(hot(80)));
% % vibgyor = [1 1 1;0 0 0; 0.7 0 1; 0.4 0.8 1; 0.3 0.1 1;0.2 0.9 0.2;1 0.9 0;0.8 0.8 0.8 ; 1 0.1 0 ;1 0.5 0 ;1 0 0.7];
% % colormap(vibgyor);
% c = colorbar(); 
% c.Label.String = 'Gravitational Anomoly';
% %caxis([A2min Amax]);
% caxis([-100 100]);

% for i = 1:n
%     if(strcmp(S(i).type,'State')) 
%      textm(nanmean(S(i).Y),nanmean(S(i).X),S(i).name,'Color','black','HorizontalAlignment','center','VerticalAlignment','middle','FontWeight','bold','FontSize',08);            
%     end
% end
% 
% T = 'H:\TOTAL_INDIA_SCALED_DATA\Output\';
% T = strcat(T,filename);
% T = strcat(T,'.jpg');
% print(fig,'-djpeg',T,'-r300')
% % 



%Plotting the AOD on the MAP or Stiching
fig01 = figure('visible','on','units','normalized','outerposition',[0 0 1 1]);
%title({[' ' filename];}, 'Interpreter', 'none', ...
       %'FontSize',16, 'FontWeight','bold');
axesm('MapProjection','miller','MapLatLimit',[latMin,latMax],...
      'MapLonLimit',[longMin,longMax],'Grid','on',...
      'MeridianLabel','on','ParallelLabel','on','PLabelLocation',2,'PLabelMeridian','prime', ...
      'MLabelLocation',2,'MLabelParallel','equator');
 
gridm('-');
geoshow(latitude{1,1},longitude{1,1},double(GAmean), 'DisplayType','texturemap')
%surfm(latitude{1,1},longitude{1,1},double(GAmean));
geoshow([S1(14).Y], [S1(14).X],'Color','black','linewidth',2);

colormap(flipud(hot(80)));
% vibgyor = [1 1 1;0 0 0; 0.7 0 1; 0.4 0.8 1; 0.3 0.1 1;0.2 0.9 0.2;1 0.9 0;0.8 0.8 0.8 ; 1 0.1 0 ;1 0.5 0 ;1 0 0.7];
% colormap(vibgyor);
c = colorbar(); 
c.Label.String = 'Gravitational Anomoly';
%caxis([A2min Amax]);
caxis([-100 100]);

%end
