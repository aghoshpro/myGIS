function [K1,K2,Z] = Himachal(list) 
%list = dir('2017_*.tif_sf.tif');
% name = '2002_1.tif_sf';
for i = 1:length(list)
        [GAdata{i}, latitude{i}, longitude{i},MIN{i},MAX{i}] = Xtract(list(i).name);
end 
MIN{1} = abs(MIN{1});
filename = extractBefore(list(1).name,5); 
disp(MIN{1});
 meanMatrix2=cat(3,GAdata{:}); %Buiding a 3D Data Array
 GAmean = GAdata{1,1};
  GAmean(:,:) = 0;
 
 GAmean = nanmean(meanMatrix2,3);
 
 MonthlyGAmean = nanmean(nanmean(GAmean));

S1 = shaperead('India.shp','Attributes',{'X','Y','name','type'});
n1 = length(S1) ;

Kashmir = S1(14).BoundingBox;
Himachal = S1(13).BoundingBox;

% S2 = shaperead('states_provinces.shp','Attributes',{'X','Y','name','type'});
% n1 = length(S2) ;
% 
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

XlatMin  =  Himachal(1,2);%Kashmir(1,2);
XlatMax  =  Himachal(2,2); %Kashmir(2,2);
XlongMin =  Himachal(1,1);%72.30;%Kashmir(1,1);
XlongMax =  Himachal(2,1);%Kashmir(2,1);



% -------------------------------

%---- Data Extraction ---------
 Z = GAmean;
 V = Z;
 
 ind = inpolygon(longitude{1,1},latitude{1,1},[XlongMin,XlongMax],[XlatMin,XlatMax]);  
 
 V = V(ind);
 row = length(Z(:,1));
 col = length(Z(1,:));
 
 K1 = nanmean(V);
  
 
 for i = 1:row
    for j=1:col
        if(ind(i,j) == 1)
            Z(i,j) = GAmean(i,j); 
        else
            Z(i,j) = NaN;
        end
     
    end
 end

K2 = nanmean(nanmean(Z));
%----------------------------------------------------

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
% fig01 = figure('visible','off','units','normalized','outerposition',[0 0 1 1]);
% title({['Janmu & Kashmir' filename];}, 'Interpreter', 'none', ...
%        'FontSize',16, 'FontWeight','bold');
% axesm('MapProjection','miller','MapLatLimit',[latMin,latMax],...
%       'MapLonLimit',[longMin,longMax],'Grid','on',...
%       'MeridianLabel','on','ParallelLabel','on','PLabelLocation',2,'PLabelMeridian','prime', ...
%       'MLabelLocation',2,'MLabelParallel','equator');
%  
% gridm('-');
% %geoshow(latitude{1,1},longitude{1,1},double(Z), 'DisplayType','texturemap')
% surfm(latitude{1,1},longitude{1,1},double(Z));
% %textm(latitude{1,1},longitude{1,1},Zs,'Color','black');
% geoshow([S1(13).Y], [S1(13).X],'Color','black','linewidth',2);
% 
% %colormap(flipud(hot(80)));
% vibgyor = [0 0 0; 0.7 0 1; 0.4 0.8 1; 0.3 0.1 1;0.2 0.9 0.2;1 0.9 0;0.8 0.8 0.8 ; 1 0.1 0 ;1 0.5 0 ;1 0 0.7];
% colormap(vibgyor);
% c = colorbar(); 
% c.Label.String = 'Gravitational Anomoly';
% %caxis([A2min Amax]);
% caxis([-50 50]);
% T = 'H:\TOTAL_INDIA_SCALED_DATA\Himachal\';
% T = strcat(T,filename);
% T = strcat(T,'.jpg');
% print(fig01,'-djpeg',T,'-r300')
% % 
end
