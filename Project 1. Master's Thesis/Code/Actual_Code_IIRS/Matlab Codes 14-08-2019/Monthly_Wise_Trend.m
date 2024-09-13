clear;
T = (2003:2018);
year = (1750:25:2000);

JAN = dir('*031.L3*.tif');
FEB = table2struct(sortrows(struct2table([dir('*059.L3*.tif');dir('*060.L3*.tif')]),'name'));
MAR = table2struct(sortrows(struct2table([dir('*090.L3*.tif');dir('*091.L3*.tif')]),'name'));
APR = table2struct(sortrows(struct2table([dir('*120.L3*.tif');dir('*121.L3*.tif')]),'name'));
MAY = table2struct(sortrows(struct2table([dir('*151.L3*.tif');dir('*152.L3*.tif')]),'name'));
JUN = table2struct(sortrows(struct2table([dir('*181.L3*.tif');dir('*182.L3*.tif')]),'name'));
JUL = table2struct(sortrows(struct2table([dir('*212.L3*.tif');dir('*213.L3*.tif')]),'name'));
AUG = table2struct(sortrows(struct2table([dir('*243.L3*.tif');dir('*244.L3*.tif')]),'name'));
SEP = table2struct(sortrows(struct2table([dir('*273.L3*.tif');dir('*274.L3*.tif')]),'name'));
OCT = table2struct(sortrows(struct2table([dir('*304.L3*.tif');dir('*305.L3*.tif')]),'name'));
NOV = table2struct(sortrows(struct2table([dir('*334.L3*.tif');dir('*335.L3*.tif')]),'name'));
DEC = table2struct(sortrows(struct2table([dir('*365.L3*.tif');dir('*366.L3*.tif')]),'name'));


for i = 1:length(JAN)
  
  [A,R] = geotiffread(JAN(i).name);
  index_A = find(A <= min(A));  %Null value = -3.399999952144364e+38
  A(index_A) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  JAN_SST(i) = nanmean(nanmean(A));
  
  [B,R] = geotiffread(FEB(i).name);
  index_B = find(B <= min(B));  %Null value = -3.399999952144364e+38
  B(index_B) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  FEB_SST(i) = nanmean(nanmean(B));

  [C,R] = geotiffread(MAR(i).name);
  index_C = find(C <= min(C));  %Null value = -3.399999952144364e+38
  C(index_C) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  MAR_SST(i) = nanmean(nanmean(C));

  [D,R] = geotiffread(APR(i).name);
  index_D = find(D <= min(D));  %Null value = -3.399999952144364e+38
  D(index_D) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  APR_SST(i) = nanmean(nanmean(D));
    
  [E,R] = geotiffread(MAY(i).name);
  index_E = find(E <= min(E));  %Null value = -3.399999952144364e+38
  E(index_E) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  MAY_SST(i) = nanmean(nanmean(E));
  
  [F,R] = geotiffread(JUN(i).name);
  index_F = find(F <= min(F));  %Null value = -3.399999952144364e+38
  F(index_F) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  JUN_SST(i) = nanmean(nanmean(F));

  [G,R] = geotiffread(JUL(i).name);
  index_G = find(G <= min(G));  %Null value = -3.399999952144364e+38
  G(index_G) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  JUL_SST(i) = nanmean(nanmean(G));
  
  [H,R] = geotiffread(AUG(i).name);
  index_H = find(H <= min(H));  %Null value = -3.399999952144364e+38
  H(index_H) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  AUG_SST(i) = nanmean(nanmean(H));
   
  [I,R] = geotiffread(SEP(i).name);
  index_I = find(I <= min(I));  %Null value = -3.399999952144364e+38
  I(index_I) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  SEP_SST(i) = nanmean(nanmean(I));
  
  [J,R] = geotiffread(OCT(i).name);
  index_J = find(J <= min(J));  %Null value = -3.399999952144364e+38
  J(index_J) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  OCT_SST(i) = nanmean(nanmean(J));
  
  [K,R] = geotiffread(NOV(i).name);
  index_K = find(K <= min(K));  %Null value = -3.399999952144364e+38
  K(index_K) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  NOV_SST(i) = nanmean(nanmean(K));
    
  [L,R] = geotiffread(DEC(i).name);
  index_L = find(L <= min(L));  %Null value = -3.399999952144364e+38
  L(index_L) = NaN;             %Convert -3.399999952144364e+38 in to NaN
  DEC_SST(i) = nanmean(nanmean(L));
  
  disp(i); 
end

%%------- Write the Mean Raster data into geotiff ------------%
fig_01 = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,3,1)
% h(1) = subplot(2,3,1);
% set(h(1), 'position',[1 1 1 1]); %[x_0 y_0 width heigth]
plot(T,JAN_SST,'linewidth',2,'color','red')

[p,~,mu] = polyfit(T,JAN_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off

% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('JANUARY');
xtickangle(45);
%legend('Monthly Mean','Linear Trend','Location','northeast')
grid on

subplot(2,3,2)
plot(T,FEB_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,FEB_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('FEBRUARY');
xtickangle(45);
% legend('Monthly Mean')
grid on


subplot(2,3,3)
plot(T,MAR_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,MAR_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('MARCH');
xtickangle(45);
%legend('Monthly Mean')
grid on


subplot(2,3,4)
plot(T,APR_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,APR_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('APRIL');
xtickangle(45);
%legend('Monthly Mean')
grid on

subplot(2,3,5)
plot(T,MAY_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,MAY_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
xtickangle(45);
title('MAY');
%legend('Monthly Mean')
grid on


subplot(2,3,6)
plot(T,JUN_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,JUN_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
xtickangle(45);
title('JUNE');
%legend('Monthly Mean','Position',[1 1 0.5 0.2])
grid on

%%------- Write the Mean Raster data into geotiff ------------%
fig_02 = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,3,1)
% h(1) = subplot(2,3,1);
% set(h(1), 'position',[1 1 1 1]); %[x_0 y_0 width heigth]
plot(T,JUL_SST,'linewidth',2,'color','red')

[p,~,mu] = polyfit(T,JUL_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off

% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('JULY');
xtickangle(45);
%legend('Monthly Mean','Linear Trend','Location','northeast')
grid on

subplot(2,3,2)
plot(T,AUG_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,AUG_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('AUGUST');
xtickangle(45);
% legend('Monthly Mean')
grid on


subplot(2,3,3)
plot(T,SEP_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,SEP_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('SEPTEMBER');
xtickangle(45);
%legend('Monthly Mean')
grid on


subplot(2,3,4)
plot(T,OCT_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,OCT_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
title('OCTOBER');
xtickangle(45);
%legend('Monthly Mean')
grid on

subplot(2,3,5)
plot(T,NOV_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,NOV_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
xtickangle(45);
title('NOVEMBER');
%legend('Monthly Mean')
grid on


subplot(2,3,6)
plot(T,DEC_SST,'linewidth',2,'color','red')
[p,~,mu] = polyfit(T,DEC_SST,1);
f = polyval(p,T,[],mu);
hold on
plot(T,f,'linewidth',1,'color','k')
hold off
% errorbar(T,Ymean,S,'-o','MarkerSize',5,...
%     'MarkerEdgeColor','black','MarkerFaceColor','red')
hold on
ylabel('Mean SST')
%ylim([0.03 0.09])
xlim([2003 2018])
xlabel('Years')
xticks(T)
xticklabels({'2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'})
xtickangle(45);
title('DECEMBER');
%legend('Monthly Mean','Position',[1 1 0.5 0.2])
grid on

% %R = georasterref('RasterSize',size(Marge_data),'LatitudeLimits',[double(latmin),double(latmax)],'LongitudeLimits',[double(longmin),double(longmax)]);
% Destination = 'C:\Users\ARKA GHOSH\Desktop\Project 2\Bay of Bengal\Month Wise\OUTPUT\';  %Savefile
% geotiffwrite(strcat(Destination,'BOB_MODIS_SST_Mean_',Year),SSTmean,RR);
%suptitle('Bay of Bengal MSL');
disp('Operation Successful');